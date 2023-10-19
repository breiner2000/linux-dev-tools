#!/bin/sh
# Se puede descargar la última versión desde https://download.docker.com/linux/static/stable/x86_64/

DOCKER_BINARIES="https://download.docker.com/linux/static/stable/x86_64/docker-24.0.6.tgz"

sudo wget $DOCKER_BINARIES -O docker-latest.tgz

sudo tar -xvzf docker-latest.tgz

sudo rm -rf docker-latest.tgz

sudo mv docker/* /usr/bin/

sudo rm -rf docker

# todo: verificar si hay que ejecutar ese comando
sudo dockerd &

# Agregar usuario al grupo para ejecutar docker sin sudo

sudo groupadd docker

sudo usermod -aG docker $USER

sudo newgrp docker

# Configurar docker para que se inicie con el sistema

wget https://raw.githubusercontent.com/moby/moby/master/contrib/init/systemd/docker.service

wget https://raw.githubusercontent.com/moby/moby/master/contrib/init/systemd/docker.socket

sudo mkdir -p /etc/systemd/system/

sudo mv -f docker.service docker.socket /etc/systemd/system/

sudo systemctl stop docker


sudo systemctl enable docker.service






