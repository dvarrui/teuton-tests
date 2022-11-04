
# Instalación y uso

Este test de Teuton tiene 2 modos de uso.
* Evaluando el resultado en máquinas remotas.
* Evaluando el resultado en contenedores.

## Modo 1: Máquinas remotas

* Ejecutamos el reto con el fichero de configuración `vm.yaml`.
```
teuton PATH/TO/THIS/TEST -cname=vm
```
* Personalizar la configuración del fichero `vm.yaml`.

## Modo 2: Contenedores

* Instalar docker en la máquina T-NODE (`zypper install docker`). Esto es, donde vamos a ejecutar Teuton.
* Levantar el servicio de Docker (`sudo systemctl start docker`)
* Crear las carpetas siguientes:
    * `var/temp/etc`, para la persistencia del contenedor.
    * `var/temp/usermin`, para poner los scripts a evaluar.
* Ejecutamos el reto con el fichero de configuración por defecto.
```
teuton PATH/TO/THIS/TEST
```
* Personalizar la configuración del fichero `config.yaml`.
