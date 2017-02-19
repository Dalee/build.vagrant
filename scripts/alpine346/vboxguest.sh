#!/usr/bin/env bash
set -eo pipefail

VERSION=$(cat /root/.vbox_version)

mkdir -p /tmp/cdrom
modprobe loop
LOOP=`losetup -f`
losetup ${LOOP} /root/VBoxGuestAdditions_$VERSION.iso
mount -t iso9660 -o ro ${LOOP} /tmp/cdrom

# install required software
apk add make gcc g++ musl-dev libc-dev linux-headers linux-grsec-dev

# initial extract of vbox additionals
if [ -d /root/install ]; then
	rm -rf /root/install
fi
mkdir /root/install
echo "af_packet" > /etc/modules

# copy base source
cp /tmp/cdrom/VBoxLinuxAdditions.run /root/install/vbox-add.run
chmod +x /root/install/vbox-add.run
/root/install/vbox-add.run --noexec --keep --target /root/install/vbox-add

# unpacking sources
mkdir -p /root/install/vbox-add-src
tar jxfv /root/install/vbox-add/VBoxGuestAdditions-amd64.tar.bz2 -C /root/install/vbox-add-src
cd /root/install/vbox-add-src/src/vboxguest-${VERSION}
make
cp ./*.ko /lib/modules/`uname -r`
depmod -a

echo "vboxguest" >> /etc/modules
echo "vboxsf" >> /etc/modules

# download whole vbox project
curl "http://download.virtualbox.org/virtualbox/${VERSION}/VirtualBox-${VERSION}.tar.bz2" -o /root/install/vbox-src.tar.bz2
mkdir -p /root/install/vbox-src
tar jxfv /root/install/vbox-src.tar.bz2 -C /root/install/vbox-src

cd /root/install/vbox-src/VirtualBox-${VERSION}/src/VBox/Additions/linux/sharedfolders
gcc ./mount.vboxsf.c ./vbsfmount.c -o mount.vboxsf \
    -I/root/install/vbox-src/VirtualBox-${VERSION}/include \
    -I/usr/src/linux-headers-`uname -r`/include \
    -D__gnu_linux__ -DIN_RING3

cp ./mount.vboxsf /usr/sbin

# cleanup
rm -rf /root/install
rm -rf /root/*.iso

# cleanup everything except make
apk del --purge \
    gcc \
    g++ \
    binutils-libs \
    binutils \
    gmp \
    isl \
    libgomp \
    libatomic \
    libgcc \
    pkgconf \
    pkgconfig \
    mpfr3 \
    mpc1 \
    libstdc++ \
    libgmpxx \
    gmp-dev \
    linux-headers \
    musl-dev libc-dev \
    linux-grsec-dev
