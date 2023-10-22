#!/bin/sh -e

TOOLBOX_DOWNLAOD="https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.0.5.17700.tar.gz"

# necesario para instalar AppImage
sudo apt-get install fuse

sudo wget -O /opt/jetbrains-toolbox.tar.gz  $TOOLBOX_DOWNLAOD

# Descomprimir el archivo
sudo tar -xzf /opt/jetbrains-toolbox.tar.gz -C /opt

# Eliminar la carpeta anterior (si existe)
sudo rm -rf /opt/jetbrains-toolbox

# Obtener el nombre de la carpeta descomprimida
FOLDER_NAME=$(sudo find /opt -type d -name "jetbrains-toolbox-*" | head -1)

sudo mv -f $FOLDER_NAME /opt/jetbrains-toolbox

# Eliminar el archivo comprimido
sudo rm /opt/jetbrains-toolbox.tar.gz


