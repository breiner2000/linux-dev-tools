
./scripts/docker_cli_installer.sh 
docker_cli_res=$? 

./scripts/docker_desktop_installer.sh
docker_desktop_res=$?


if [ "$docker_res" -eq 0 ]; then
    echo -e "\e[1;32m Docker instalado correctamente. Prueba con docker run hello-world
    \e[0m"
else
    echo -e "\e[1;31m Error al instalar Docker.
    \e[0m"
fi

if [ "$docker_desktop_res" -eq 0 ]; then
    echo -e "\e[1;32m Docker Desktop instalado correctamente.
    \e[0m"
else
    echo -e "\e[1;31m Error al instalar Docker Desktop.
    \e[0m"
fi











