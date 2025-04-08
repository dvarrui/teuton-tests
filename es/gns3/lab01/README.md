
# Laboratorio 01 - GNS3 con Teuton

## Enunciado

El alumno debe crear un proyecto GNS3 según el siguiente esquema:

![](images/esquema.png)

* El fichero del proyecto debe estar en la ruta `project/lab.gns3`.
* Crear un VPCS con el nombre `PC1` y la IP `192.168.1.201`.
* Crear un VPCS con el nombre `PC2` y la IP `192.168.1.202`.
* Crear un switch con el nombre `Switch1`.
* Conectar los dispositivos según el esquema anterior.

> Recordar que hay que grabar las configuraciones.

## Situación 1: Ejecución en localhost

Instalación por defecto de GNS3 en una única máquina.

![](images/diagrama1.png)

Vamos a suponer que tenemos el siguiente entorno:
* Tenemos una máquina que tiene instalado Teuton y el GNS3.
* El GNS3 Server está configurado para escuchar en la IP localhost.
* En el Host deben estar los comandos `jq`, `curl` y el fichero del proyecto GNS3

Esta situación es útil en:
* Un profesor está desarrollando y probando la actividad en local.
* Un alumno está trabajando la actividad y usa los test para autoevaluar su progreso.

> Se han creado varias versiones del mismo test de Teuton, donde cada versión incluye una pequeña mejora con respecto de la versión anterior.

### Test_v1: Primera versión

[Consultar el test_v1](test_v1)

El test tiene los `targets` definidos en dos ficheros.

* Fichero `project.rb`:
  * Se definen `targets` que leen el contenido del proyecto GNS3 (`project/lab.gns3`). 
  * Se hacen consultas al proyecto GNS3 para crear nuevos parámetros con los valores de los puerto correspondientes a la consola de cada dispositivo VPCS.
  * Vemos como se usa el comando `jq` para leer el contenido JSON del fichero del proyecto GNS3.
* Fichero `interfaces.rb`:
  * Se definen `targets` que "inyectan" comandos en la consola de cada dispositivo VPCS del simulador y valoran su salida.
  * Se usan los comandos `echo` y `curl` para "inyectar" comandos en IP:Port correspondiente a la consola de cada dispositivo.
  * Es necesario que el GNS3 server esté en ejecución y los dispositivos activados.

### Test_v2: Cambiando tareas repetitivas por bucles (Iteradores)

[Consultar el test_v2](test_v2)

Este test es una copia del anterior pero se han realizado algunas mejoras.

* Del fichero de configuración se han eliminado los parámetro `project_file` y `project_dir`, porque se pueden extraer del parámetro `project_path`. Esto lo podemos ver en las líneas 3-9 del fichero `project.rb`.
* En el fichero `project.rb` se han sustituido algunas tareas repetitivas por un bucle (iterador) como podemos ver en las líneas 16-23 y 29-36.
* En el fichero `interfaces.rb` se añaden varias instrucciones `readme` que nos ayudarán a la construcción de un fichero Markdown con el enunciado. Esto lo podemos ver en la líneas 2-4 y 23-25.

Para construir un enunciado a partir del test hacemos:

```bash
teuton readme test_v2 > test2/README.md
```

Podemos consultar el resultado en el fichero [test_v2/README.md](test2/README.md).

## Situación 2: Ejecución en una red de máquinas

Instalación por defecto de GNS3 en varias máquinas con acceso SSH desde el exterior.

![](images/diagrama2.png)

Vamos a suponer que tenemos el siguiente entorno:
* Cada alumno tiene su propia máquina, donde tiene instalado el GNS3.
* El GNS3 Server está configurado para escuchar en la IP localhost.
* Cada alumno tiene instalado el servicio SSH en su máquina (Host).
* El profesor debe tener acceso SSH a cada máquina de los alumnos.
* En cada Host deben estar los comandos `jq` y `curl`.

Esta situación es útil para:
* Un profesor desea evaluar el trabajo que están desarrollando los alumnos en sus máquinas.

> Se han creado varias versiones del mismo test de Teuton, donde cada versión incluye una pequeña mejora con respecto de la versión anterior.

### Test_v1: Primera versión

En este caso se modifica el fichero `test_v1/config.yaml` de la siguiente forma:
* Se añaden las configuraciones de los diferentes alumnos (`cases`).
* Los parámetros que se repiten de cada `case` se ponen en la sección `global`.
* Cada alumno tiene una IP diferente en su Host.

```yaml
---
global:
  project_file: lab.gns3
  project_dir: project
  project_path: project/lab.gns3
  gns3server_ip: localhost
  pc1_ip: 192.168.99.1
  pc2_ip: 192.168.99.2
cases:
- tt_members: Student1
  host_ip: 192.168.1.1
- tt_members: Student2
  host_ip: 192.168.1.2
```

### Test_v2: Cambiando tareas repetitivas por bucles (Iteradores)

En este caso usa un fichero `test_v2/config.yaml`, donde se reflejan las configuraciones de cada uno de los alumnos (`cases`).

## Situación 3

EN DESAROLLO!
