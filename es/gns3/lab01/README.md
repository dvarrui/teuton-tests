
# Laboratorio GNS3 con Teuton - 01

## Enunciado del problema GNS3

El alumno debe crear un proyecto GNS3 con los siguientes requisitos:
* El proyecto debe estar en la ruta `project/lab.gns3`.
* Crear un VPCS con el nombre `PC1` y la IP `192.168.1.201`.
* Crear un VPCS con el nombre `PC2` y la IP `192.168.1.202`.
* Crear un switch con el nombre `Switch1`.

> Recordar que hay que grabar las configuraciones.

Conectar los dispositivos según el siguiente esquema:

![](images/esquema.png)

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
* **Test3**: Cambiando el uso de los comandos `echo` y `curl` por conexiones Telnet directas. Es necesario que el cliente `Telnet` esté disponible en cada Host.

### Test1: Primera versión

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

