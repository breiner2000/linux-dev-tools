#!/bin/sh -e

DOCKER_DEB_PACKAGE="https://desktop.docker.com/linux/main/amd64/docker-desktop-4.24.2-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"


sudo apt install gnome-terminal

# Verificar si el paquete docker-desktop está instalado
if dpkg -l | grep -q docker-desktop; then
    echo "El paquete docker-desktop está instalado."

    # Verificar si el directorio ~/.docker/desktop existe antes de intentar eliminarlo
    if [ -d "$HOME/.docker/desktop" ]; then
        rm -r "$HOME/.docker/desktop"
    else
        echo "El directorio $HOME/.docker/desktop no existe."
    fi

    # Verificar si el archivo /usr/local/bin/com.docker.cli existe antes de intentar eliminarlo
    if [ -e "/usr/local/bin/com.docker.cli" ]; then
        sudo rm "/usr/local/bin/com.docker.cli"
    else
        echo "El archivo /usr/local/bin/com.docker.cli no existe."
    fi

    # Desinstalar el paquete docker-desktop
    sudo apt remove docker-desktop -y
    sudo apt purge docker-desktop -y
else
    echo "El paquete docker-desktop no está instalado."
fi

# Instalar docker desktop
cd /tmp

sudo wget -O docker-desktop.deb $DOCKER_DEB_PACKAGE 

sudo apt-get install ./docker-desktop.deb

sudo rm -r docker-desktop.deb





