#!/bin/sh -e

DOCKER_DEB_PACKAGE="https://desktop.docker.com/linux/main/amd64/docker-desktop-4.24.2-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"


sudo apt install gnome-terminal

# Remover versiones anteriores de docker desktop
if dpkg -l | grep -q docker-desktop; then
    echo "El paquete docker-desktop está instalado."
    sudo apt remove docker-desktop
    rm -r $HOME/.docker/desktop
    sudo rm /usr/local/bin/com.docker.cli
    sudo apt purge docker-desktop
else
    echo "El paquete docker-desktop no está instalado."
fi

# Instalar docker desktop
sudo wget $DOCKER_DEB_PACKAGE -O docker-desktop.deb

sudo apt-get install -y ./docker-desktop.deb

sudo rm docker-desktop.deb





