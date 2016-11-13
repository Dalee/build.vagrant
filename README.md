# Base images building

## Vagrant

 * VirtualBox >= 5.0.26, https://www.virtualbox.org/
 * Vagrant >= 1.8.4, https://www.vagrantup.com/
 * Packer >= 0.11.0, https://www.packer.io/

Use `packer` to build images automatically:

 * Ubuntu 14.04.05
 * Alpine Linux 3.4.6

```bash
packer build ./ubuntu14.json
packer build ./alpine346.json
```

### metadata.json

Check out `example/example-metadata.json` for examples.

```bash
openssl sha1 ./build/*.box
```
