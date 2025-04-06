
# Laboratorio GNS3 con Teuton - 01

## Enunciado del problema GNS3

El alumno debe crear un proyecto GNS3 según el siguiente esquema:

![](images/esquema.png)

* El proyecto debe estar en la ruta `project/lab.gns3`.
* Crear un VPCS con el nombre `PC1` y la IP `192.168.1.201`.
* Crear un VPCS con el nombre `PC2` y la IP `192.168.1.202`.
* Crear un switch con el nombre `Switch1`.
* Conectar los dispositivos según el esquema anterior.

> Recordar que hay que grabar las configuraciones.

## Entorno de trabajo

Vamos a suponer que tenemos el siguiente entorno:

![](images/diagrama1.png)

Esto es, suponemos que 
* Cada alumno tiene su propia máquina, donde tiene instalado el GNS3.
* El GNS3 Server está configurado para escuchar en la IP localhost.
* Cada alumno tiene instalado el servicio SSH en su máquina (Host).
* El profesor debe tener acceso SSH a cada máquina de los alumnos.
* En cada Host deben estar los comandos `jq` y `curl`.

## Tests de Teuton

A continuación vamos con el test de Teuton necesario para comprobar que se cumple el enunciado del laboratorio. Para facilitar el aprendizaje de las posibildiades que ofrece Teuton, se han creado varias versiones del mismo test, donde cada una incluye una pequeña mejora con respecto de la versión anterior.

* **Test1**: Primera versión
* **Test2**: Cambiando tareas repetitivas por bucles (Iteradores)
* **Test3 (EN DESARROLLO)**: Cambiando el uso de los comandos `echo` y `curl` por conexiones Telnet directas. Es necesario que el cliente `Telnet` esté disponible en cada Host.

### Test1: Primera versión

[Consultar el test1](test1)

El test tiene los `targets` definidos en dos ficheros.

* Fichero `project.rb`:
  * Se definen `targets` que leen el contenido del proyecto GNS3 (`project/lab.gns3`). 
  * Se hacen consultas al proyecto GNS3 para crear nuevos parámetros con los valores de los puerto correspondientes a la consola de cada dispositivo VPCS.
  * Vemos como se usa el comando `jq` para leer el contenido JSON del fichero del proyecto GNS3.
* Fichero `interfaces.rb`:
  * Se definen `targets` que "inyectan" comandos en la consola de cada dispositivo VPCS del simulador y valoran su salida.
  * Se usan los comandos `echo` y `curl` para "inyectar" comandos en IP:Port correspondiente a la consola de cada dispositivo.
  * Es necesario que el GNS3 server esté en ejecución y los dispositivos activados.

### Test2: Cambiando tareas repetitivas por bucles (Iteradores)

[Consultar el test2](test2)

Este test es una copia del anterior pero se han realizado algunas mejoras.

Del fichero de configuración se han eliminado los parámetro `project_file` y `project_dir`, porque se pueden extraer del parámetro `project_path`. Esto lo podemos ver en las líneas 3-9 del fichero `project.rb`.

En el fichero `project.rb` se han sustituido algunas tareas repetitivas por un bucle (iterador) como podemos ver en las líneas 16-23 y 29-36.

En el fichero `interfaces.rb` se añaden varias instrucciones `readme` que nos ayudarán a la construcción de un fichero Markdown con el enunciado. Esto lo podemos ver en la líneas 2-4 y 23-25.

Para construir un enunciado a partir del test hacemos:

```bash
teuton readme test2 > test2/README.md
```

Podemos consultar el resultado en el fichero [test2/README.md](test2/README.md).
