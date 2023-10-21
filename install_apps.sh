#!/bin/sh
./scripts/docker_cli_installer.sh 
docker_cli_res=$? 

./scripts/docker_desktop_installer.sh
docker_desktop_res=$?

./scripts/vscode_installer.sh
vscode_res=$?

if [ "$docker_cli_res" -eq 0 ]; then
    echo "\e[1;32m Docker instalado correctamente. 
    \e[0m"
else
    echo "\e[1;31m Error al instalar Docker.
    \e[0m"
fi

if [ "$docker_desktop_res" -eq 0 ]; then
    echo "\e[1;32m Docker Desktop instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar Docker Desktop.
    \e[0m"
fi

if [ "$vscode_res" -eq 0 ]; then
    echo "\e[1;32m VSCode instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar VSCode.
    \e[0m"
fi

echo "\e[1;32m Reiniciar el sistema :). \e[0m"












