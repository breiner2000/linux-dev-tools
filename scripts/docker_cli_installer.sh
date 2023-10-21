#!/bin/sh -e

# Desinstalar todos los paquetes que pueden causar conflictos
# Función para desinstalar un paquete si está instalado
remove_if_installed() {
    if dpkg -l "$1" &> /dev/null; then
        sudo apt-get remove "$1" -y
    fi
}

# Función para purgar un paquete si está instalado
purge_if_installed() {
    if dpkg -l "$1" &> /dev/null; then
        sudo apt-get purge "$1" -y
    fi
}

# Desinstalar todos los paquetes que pueden causar conflictos
packages=(
    docker.io
    docker-doc
    docker-compose
    docker-compose-v2
    podman-docker
    containerd
    runc
)

for pkg in "${packages[@]}"; do
    remove_if_installed "$pkg"
done

# Purgar otros paquetes
packages_to_purge=(
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
    docker-ce-rootless-extras
)

for pkg in "${packages_to_purge[@]}"; do
    purge_if_installed "$pkg"
done

# Limpiar directorios
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


