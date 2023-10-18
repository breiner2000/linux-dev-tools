DOCKER_DEB_PACKAGE="https://desktop.docker.com/linux/main/amd64/docker-desktop-4.24.2-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"


# TEST KVM virtualization support
modprobe kvm

# Para procesadores Intel
# modprobe kvm_intel
modprobe kvm_amd    # AMD processors
ls -al /dev/kvm

# todo: verificar si se ocupa el siguiente
# sudo usermod -aG kvm $USER

# Instalacion en Ubuntu

# Remover versiones anteriores
sudo apt install gnome-terminal
sudo apt remove docker-desktop

rm -r $HOME/.docker/desktop
sudo rm /usr/local/bin/com.docker.cli
sudo apt purge docker-desktop

# Instalar docker desktop
sudo wget $DOCKER_DEB_PACKAGE -O docker-desktop.deb

sudo apt-get install -y ./docker-desktop.deb

systemctl --user start docker-desktop

docker compose version

docker --version

docker version

