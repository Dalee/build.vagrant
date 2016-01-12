# Сборка базовых образов

## Готовые образы

Готовые образы и минимальные метаописания доступны по адресу: http://vagrant.git.dalee.ru/

## Vagrant

 * VirtualBox >= 5.0.12, https://www.virtualbox.org/
 * Vagrant >= 1.7.4, https://www.vagrantup.com/
 * Packer >= 0.8.6, https://www.packer.io/

Сборка осуществляется в автоматическом режиме:

 * CentOS 7.2
 * Debian 8.2

```bash
packer build ./centos72-vagrant.json
packer build ./debian82-vagrant.json
```

### metadata.json

Для автоматического обновления базовых образов необходимо создать файл метаданных.

TODO:
 * metadata.json, https://www.scriptscribe.org/infrastructure/versioned-vagrant-boxes-privately/
 * serverspec для тестирования образов
 * система сборки для автоматизации (grunt, gradle, maven, buildbot?)

## Docker

TBD.
