# linux-dev-tools

Ejecutar `./install_apps` para instalar todas las herramientas de desarrollo web en linux

> **Note:** Si se desean versiones más nuevas ejecutar `./scripts/execute_python_script` y actualizar los links en los scripts correspondientes.

- [x] Docker
- [x] Docker Desktop
- [x] VSCode
- [x] Jetbrains Toolbox
- [x] JDK 17.0.9
- [x] NodeJS 21.6.2
- [x] Gradle 8.4
- [x] Maven 3.9.6

> **Note:** Docker Desktop necesita del KVM, se necesita activar en el bios.

## Comandos a ejecutar despues de ejectuar el script

### Test docker

```shell
docker compose version
docker --version
docker version
```

### Test JDK

```shell
java -version
```

### Test NodeJS

```shell
node --version
```

### Test Gradle

```shell
gradle -version
```

### Test Maven

```shell
mvn -version
```
