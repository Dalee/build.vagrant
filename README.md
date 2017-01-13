# Base images building

## Published artifacts

https://atlas.hashicorp.com/Dalee/

## Vagrant

 * VirtualBox >= 5.0.26, https://www.virtualbox.org/
 * Vagrant >= 1.8.4, https://www.vagrantup.com/
 * Packer >= 0.11.0, https://www.packer.io/

Use `packer` to build images:

 * Ubuntu 14.04.05 LTS (deprecated)
 * Ubuntu 16.04.1 LTS
 * Alpine Linux 3.4.6

```bash
packer build ./ubuntu14.json
packer build ./ubuntu16.json
packer build ./alpine346.json
```

### Self-hosted boxes

Check out `example/example-metadata.json` and `example/example-vagrantfile` for self-hosted boxes.

To calculate correct sha1 signature for a box, use:
```bash
openssl sha1 ./build/*.box
```
