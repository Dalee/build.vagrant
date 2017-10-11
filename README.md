# General purpose Web-development Vagrant box

This [Ubuntu 16.04](https://atlas.hashicorp.com/Dalee/boxes/ubuntu) 
box, which is heavily used internally.

> Also, you can check out our [Ansible roles](https://galaxy.ansible.com/Dalee/). 
They allow quickly build PHP or Node.js based ready-to-use environment 
on top of this box.

What included:
 * VirtualBox Guest Additions (of course)
 * [mailhog](https://github.com/mailhog/MailHog) (web-interface on :8025)
 * [nullmail](https://github.com/bruceg/nullmailer) (system-wide MTA)
 * [udp-web-logger](https://github.com/Dalee/udp-web-logger)
 * `en_US.UTF-8` and `ru_RU.UTF-8` locales (default: `en_US.UTF-8`)
 * Pre-installed software: `ansible`, `mc`, `git`, etc..
 * Filesystem optimization: `noatime`, `nodiratime`
 * Easy add new interfaces: `source /etc/network/interfaces.d/*` already 
    included in `/etc/network/interfaces`
 * Grub optimizations: `quiet`, `fastboot`

Removed software:
 * `cron` — it's a dangerous idea have working cron in development vm
 * `syslog` — just use `journalctl`


## DIY

In case you want to build boxes yourself.

### Requirements

 * VirtualBox >= 5.1.22, https://www.virtualbox.org/
 * Vagrant >= 1.9.4, https://www.vagrantup.com/
 * Packer >= 0.11.0, https://www.packer.io/

### How to build
Use `packer` to build image:

```bash
packer build ./ubuntu16.json
```

Start any build process and take a rest, depending on your system,
build will finish in ~20-30 minutes.

### Self-hosted boxes

Do not want to upload box to Atlas? Here is the solution:

Check out `example/example-metadata.json` and `example/example-vagrantfile` for self-hosted boxes.

To calculate correct sha1 signature for a box, use:
```bash
openssl sha1 ./build/*.box
```

## License

Code is unlicensed. Do whatever you want with it. [Set Your Code Free](http://unlicense.org/).
