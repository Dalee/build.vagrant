# Dalee base images

[Ubuntu box](https://atlas.hashicorp.com/Dalee/boxes/ubuntu) 
heavily used internally for all our development processes.

Also, you can check our cool [Ansible roles](https://galaxy.ansible.com/Dalee/). 
They allow you to build PHP/PostgreSQL or Node.js ready-to-use environment on top 
of Ubuntu box (there are more roles, actually).

## Artifacts

https://atlas.hashicorp.com/Dalee/

## DIY

In case you want to build boxes yourself.

### Requirements

 * VirtualBox >= 5.0.26, https://www.virtualbox.org/
 * Vagrant >= 1.8.4, https://www.vagrantup.com/
 * Packer >= 0.11.0, https://www.packer.io/

### How to build
Use `packer` to build images:

 * Ubuntu 16.04.1 LTS
 * Alpine Linux 3.4.6 (*experimental*)
 * Ubuntu 14.04.05 LTS (*deprecated*, Ansible role support dropped)

```bash
packer build ./ubuntu14.json
packer build ./ubuntu16.json
packer build ./alpine346.json
```

Start any build process and take a rest, depending on your system,
build will finish in ~20-30 minutes.

### Self-hosted boxes

Do not want to upload boxes to Atlas? Here is the solution:

Check out `example/example-metadata.json` and `example/example-vagrantfile` for self-hosted boxes.

To calculate correct sha1 signature for a box, use:
```bash
openssl sha1 ./build/*.box
```

## Notes about Alpine Box

Alpine box has built-in VirtualBox Guest Additions, but, 
Vagrant itself lacks of support Alpine configuration (like ethernet configuration).

There is a [Alpine plugin](https://github.com/maier/vagrant-alpine) for Vagrant,
but there are some NFS mounts problems with undefined root cause.

## License

Code is unlicensed. Do whatever you want with it. [Set Your Code Free](http://unlicense.org/).
