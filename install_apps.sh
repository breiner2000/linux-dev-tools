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

if [ "$jetbrains_res" -eq 0 ]; then
    echo "\e[1;32m Jetbrains Toolbox instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar Jetbrains Toolbox.
    \e[0m"
fi

if [ "$gradle_res" -eq 0 ]; then
    echo "\e[1;32m Gradle instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar Gradle.
    \e[0m"
fi

if [ "$maven_res" -eq 0 ]; then
    echo "\e[1;32m Maven instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar Maven.
    \e[0m"
fi

if [ "$nodejs_res" -eq 0 ]; then
    echo "\e[1;32m NodeJS instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar NodeJS.
    \e[0m"
fi

if [ "$jdk_res" -eq 0 ]; then
    echo "\e[1;32m JDK 17 instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar JDK 17.
    \e[0m"
fi

if [ "$nodejs_res" -eq 0 ]; then
    echo "\e[1;32m NodeJS instalado correctamente.
    \e[0m"
else
    echo "\e[1;31m Error al instalar NodeJS.
    \e[0m"
fi

echo "\e[1;32m Reiniciar el sistema :). \e[0m"












