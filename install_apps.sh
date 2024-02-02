#!/bin/sh
./scripts/docker_cli_installer.sh 
docker_cli_res=$? 

./scripts/docker_desktop_installer.sh
docker_desktop_res=$?

./scripts/vscode_installer.sh
vscode_res=$?

./scripts/jetbrains_toolbox_installer.sh
jetbrains_res=$?

./scripts/gradle_installer.sh
gradle_res=$?

./scripts/maven_installer.sh
maven_res=$?

./scripts/nodejs_installer.sh
nodejs_res=$?

./scripts/jdk-17_installer.sh
jdk_res=$?

# instalar python3.10-venv
./scripts/python_venv_installer.sh


print_status() {
    if [ "$1" -eq 0 ]; then
        echo -e "\e[1;32m $2
        \e[0m"
    else
        echo -e "\e[1;31m $3
        \e[0m"
    fi
}

print_status $docker_cli_res "Docker instalado correctamente." "Error al instalar Docker."
print_status $docker_desktop_res "Docker Desktop instalado correctamente." "Error al instalar Docker Desktop."
print_status $vscode_res "VSCode instalado correctamente." "Error al instalar VSCode."
print_status $jetbrains_res "Jetbrains Toolbox instalado correctamente." "Error al instalar Jetbrains Toolbox."
print_status $gradle_res "Gradle instalado correctamente." "Error al instalar Gradle."
print_status $maven_res "Maven instalado correctamente." "Error al instalar Maven."
print_status $nodejs_res "NodeJS instalado correctamente." "Error al instalar NodeJS."
print_status $jdk_res "JDK 17 instalado correctamente." "Error al instalar JDK 17."

echo "\e[1;32m Reiniciar el sistema :). \e[0m"












