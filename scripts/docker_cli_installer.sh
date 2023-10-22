#!/bin/sh -e

# Desinstalar todos los paquetes que pueden causar conflictos
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg -y; done


# Verificar e intentar purgar los paquetes solo si están instalados
for pkg in docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras; do
    if sudo dpkg-query -W -f='${Status}' "$pkg" 2>/dev/null | grep -q "installed"; then
        sudo apt-get purge "$pkg" -y
    else
        echo "$pkg no está instalado, no se puede purgar."
    fi
done


sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker Engine:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y 

# PostInstall

# Verificar si el grupo docker ya existe
if getent group docker > /dev/null; then
    echo "El grupo docker ya existe."
else
    # Crear el grupo docker si no existe
    sudo groupadd docker
    echo "Se ha creado el grupo docker."
fi

# Añadir al usuario actual al grupo docker
sudo usermod -aG docker $USER


