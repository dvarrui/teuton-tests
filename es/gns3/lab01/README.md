
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
* En cada Host deben estar los comandos jq y curl.

## Tests de Teuton

Se han creado varias versiones del mismo test de Teuton, cada una es una mejora de la versión anterior.

* Test1
* Test2
* Test3: En desarrollo!


### Test1

