
# Instalación y uso

Esta forma de usar el test de Teuton con contenedores es poco habitual, pero se puede hacer. En tal caso, es recomendable conocer docker para saber lo que estamos haciendo.

## Preparar el entorno

Ejecutar el script `bin/up_environ.sh` desde el directorio donde tenemos la carpeta `var`. Esto es, desde  donde vamos a lanzar los tests. El script realiza lo siguiente:
1. Instalar docker en la máquina T-NODE (`zypper install docker`). Esto es, donde vamos a ejecutar Teuton.
2. Levantar el servicio de Docker (`sudo systemctl start docker`)
3. Crear las carpetas siguientes:
    * `var/usermin/temp/profesor/etc`, para la persistencia del contenedor.
    * `var/usermin/temp/profesor/opt`, para la persistencia del contenedor y ubicar los scripts a evaluar.
4. Copia el script del profesor en `var/usermin/temp/profesor/opt`.

## Configuración

* Personalizar la configuración del fichero `config.yaml`. Sobre todo tener en cuenta las rutas de los volúmenes.

##Ejecutar el test

* Ejecutamos el reto con el fichero de configuración por defecto.
```
teuton PATH/TO/THIS/TEST
```

## Advertencia

Hacer notar que por defecto todos los `cases` se ejecutan en paralelo para optimizar los tiempos de ejecución. Aunque también podemos ejecutarlos de forma secuencial configurando el parámetro `tt_sequence: true`.

Tener en cuenta que:
* El nombre de cada contenedor docker debe ser único. Por ejemplo `usermin_profesor`, `usermin01`, `usermin02`, etc.
* El directorio del volumen `etc` debe ser único. Por ejemplo `var/usermin/temp/01/etc`, `var/usermin/temp/02/etc`, etc.
* El directorio del volumen `opt` debe ser único. Por ejemplo `var/usermin/temp/01/opt`, `var/usermin/temp/02/opt`, etc. El volumen del directorio `opt` podría estar compartido por todas las instancias, siempre que los nombres de los scripts de cada alumno no entren en conflicto. Además este volumen se puede poner en modo de sólo lectura por seguridad.
