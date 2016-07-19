# Base images building

## Vagrant

 * VirtualBox >= 5.0.12, https://www.virtualbox.org/
 * Vagrant >= 1.7.4, https://www.vagrantup.com/
 * Packer >= 0.8.6, https://www.packer.io/

Use `packer` to build images automatically:

 * CentOS 7.2.1511
 * Debian 8.2.0
 * Ubuntu 14.04.04

```bash
packer build ./centos72.json
packer build ./debian82.json
packer build ./ubuntu14.json
```

### metadata.json

Metadata file is required for base images to be updated automatically.

Check out `example/example-metadata.json` for examples.

```bash
openssl sha1 ./build/dalee-ubuntu.box
```
