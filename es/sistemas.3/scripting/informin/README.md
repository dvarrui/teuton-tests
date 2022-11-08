
# Proyecto INFORMIN

## Descripción

Los administradores de sistemas necesitan en muchas ocasiones recabar información sobre el sistema para conocer el estado del mismo: capacidad de los discos, número de usuarios del sistema, usuarios conectados, nivel de ejecución actual y anterior, etc. Esta tarea necesita de la ejecución de muchos comandos, que el administrador debe repetir cada vez que quiere conocer estos datos.

Este proyecto consiste en elaborar un script para la BASH en GNU/Linux que genere informes, detallados o sencillos, sobre distintos aspectos del sistema (“informin” proviene de la combinación de **INFOR**me y ad**MIN**istrador):

* El nombre del script será `informin.sh`.

## Sintaxis

* La sintaxis del script es la siguiente:

```
informin.sh [ --help | --usuarios | --discos | --completo ] [ --detallado ]
```

* El funcionamiento del script será el siguiente:

| Opción     | Descripción |
| ---------- | ----------- |
| --help     | Muestra la ayuda, explicando para qué sirve el script, sus distintas opciones y cómo se utiliza |
| --usuarios | Genera un documento en formato HTML con información sobre los usuarios de sistema: nombre, UID y GID. Si se especifica la opción --detallado, se incluirá también la Shell y el HOME |
| --discos 	 | Genera un documento en formato HTML con información sobre los discos de sistema: fichero de dispositivo (p.ej.: `/dev/sda1`) y el espacio total. Si se especifica la opción `--detallado`, se incluirá también el espacio ocupado y el disponible (en MB).
| --completo | Genera un documento HTML con la información de todos los usuarios, los discos, la memoria y los procesos |
| Sin opciones | Se mostrará un menú que permitirá seleccionar el informe que se quiere generar (Usuarios, Discos, Memoria, Procesos o Completo), y luego se pedirá si se quiere detallado o no |

En todas las opciones, tras generar el informe, éste se abrirá con Firefox:

```
$ firefox /tmp/<informe>.html
```

Los documentos HTML se generarán en el directorio temporal `/tmp`, y se eliminarán al cerrar `firefox`.

Se tendrá en cuenta que se verifiquen los parámetros especificados por el usuario y se controlen, en la medida de lo posible, los errores.

## Ejemplos

### Informe de usuarios

```
$ ./informin.sh --usuarios
```

Suponiendo que:

```
$ cat /etc/passwd
[...]
fran:x:1000:1000:Fran,,,:/home/fran:/bin/bash
angel:x:1001:1002::/home/angel:/bin/bash
charlie:x:1002:1003::/home/charlie:/bin/bash
```

El contenido del informe generado (`/tmp/usuarios.html`) sería:

```html
<html>
  <head><title>Informin</title></head>
  <body>
    <h2>Informe sobre usuarios </h2>
    <table>
      <tr><th>Nombre</th><th>UID</th><th>GID</th></tr>
      [...]
      <tr><td>fran</td><td>1000</td><td>1000</td></tr>
      <tr><td>angel</td><td>1001</td><td>1002</td></tr>
      <tr><td>charlie</td><td>1002</td><td>1003</td></tr>
    </table>
  </body>
</html>
```

Y al abrirse Firefox veríamos lo siguiente:

![](https://asir-add.github.io/docs/scripting/bash/proyectos/imagenes/informin-usuarios.png)

### Informe de usuarios detallado

```
$ ./informin.sh --usuarios --detallado
```

El contenido del informe generado (/tmp/usuarios.html) sería:

```html
<html>
  <head><title>Informin</title></head>
  <body>
  	<h2>Informe sobre usuarios detallado</h2>
  	<table>
        <tr><th>Nombre</th><th>UID</th><th>GID</th><th>Shell</th><th>Home</th></tr>
        [...]
        <tr><td>fran</td><td>1000</td><td>1000</td><td>/bin/bash</td><td>/home/fran</td></tr>
        <tr><td>angel</td><td>1001</td><td>1002</td><td>/bin/bash</td><td>/home/angel</td></tr>
        <tr><td>charlie</td><td>1002</td><td>1003</td><td>/bin/bash</td><td>/home/charlie</td></tr>
    </table>
  </body>
</html>
```

Infor
