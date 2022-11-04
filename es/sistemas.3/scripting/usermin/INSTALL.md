
# Instalación y uso

Este test de Teuton tiene 2 modos de uso.
* Evaluando el resultado en máquinas remotas.
* Evaluando el resultado en contenedores.

## Modo 1: Máquinas remotas

Esta es la forma clásica y más sencilla de usar el test.

**Preparar el entorno**

* Aquí tenemos poco o nada que preparar. Son los alumnos los que deben tener sus máquinas accesibles por SSH y listo.
* Para realizar pruebas hemos preparado un fichero `vagrant/Vagranfile` para levantar una máquina virtual mediante Vagrant.

**Ejecutar el test**

* Asegurarse de que en el fichero `start.rb` las instrucciones `use` activas apuntan todas a `lib/vm/*`. Comentar el resto.
* Ejecutamos el reto con el fichero de configuración `vm.yaml`.
```
teuton PATH/TO/THIS/TEST -cname=vm
```
* Personalizar la configuración del fichero `vm.yaml`.

## Modo 2: Contenedores

Esta forma de usar el test de Teuton con contenedores es poco habitual, pero se puede hacer. En tal caso, es recomendable conocer docker para saber lo que estamos haciendo.

**Preparar el entorno**

* Instalar docker en la máquina T-NODE (`zypper install docker`). Esto es, donde vamos a ejecutar Teuton.
* Levantar el servicio de Docker (`sudo systemctl start docker`)
* Crear las carpetas siguientes:
    * `var/temp/etc`, para la persistencia del contenedor.
    * `var/temp/usermin`, para poner los scripts a evaluar.

**Ejecutar el test**

* Asegurarse de que en el fichero `start.rb` las instrucciones `use` activas apuntan todas a `lib/docker/*`. Comentar el resto.
* Ejecutamos el reto con el fichero de configuración por defecto.
```
teuton PATH/TO/THIS/TEST
```
* Personalizar la configuración del fichero `config.yaml`.

Hacer notar que por defecto todos los `cases` se ejecutan en paralelo para optimizar los tiempos de ejecución. Sin embargo en este caso hemos desactivado el modo paralelo y lo tenemos en secuencial `tt_sequence: true`. Esto es, que todos los `cases` se ejecutan uno detrás de otro.

¿Por qué? Porque hemos preparado nuestro entorno de ejecución para usar únicamente 1 contenedor. Y ese contenedor no debe estar compartido por varios `cases` al mismo tiempo para evitar que se mezclen lo resultados.

¿Se pueden ejecutar las pruebas en paralelo en contenedores diferentes? ¡Sí! Pero hay que hacer algunos cambios. Cada `case` tiene que tener los siguientes parámetros diferentes:
* `docker_name`: El nombre del contenedor docker debe ser único.
* `docker_vol_etc`: El directorio del volumen `etc` debe ser único.

El volumen del directorio `opt` puede estar compartido por todas las instancias, siempre que los nombres de los scripts de cada alumno no entren en conflicto. Además este volumen se puede poner en modo de sólo lectura por seguridad.

* `docker_vol_opt`: Puede ser uno compartido por todos o uno único por `case`.
* `script`: El nombre del script de cada alumno debe ser único, si se ponen todos en la misma carpeta.
