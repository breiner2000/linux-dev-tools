#!/bin/bash -e

# Instalar el paquete python3.10-venv
sudo apt install python3.10-venv -y

# Crear un entorno virtual
python3 -m venv venv

# Activar el entorno virtual
. venv/bin/activate

# Instalar las dependencias
pip install -r ./scripts/requirements.txt

# Ejecutar el script
python ./scripts/main.py

# Desactivar el entorno virtual
deactivate

# Eliminar el entorno virtual
rm -r venv