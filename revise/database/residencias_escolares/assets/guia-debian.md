
# Guía: Instalar MySQL en Debian

* Accede al servidor por medio de una terminal.
* `apt-get install mysql-server mysql-client`, instalar MySQL con el siguiente comando.

> Introducir la contraseña para el usuario root durante la instalación.

* `mysql -u root`, entrar a MySQL como root para hacer modificaciones.

> Si tenemos error al identificar el usuario root, entonces proporcionar la contraseña con el parámetro -p: `mysql -u root -p`

---

## Recuperar la contraseña de root de MySQL

Enlace de interés:
* [Cómo recuperar la contraseña de root de MySQL](https://clouding.io/kb/mysql-como-recuperar-la-contrasena-de-root/)

Si has perdido la contraseña del usuario root de MySQL, es posible restablecerla siguiendo los pasos que detallamos a continuación.

* Acceder al servidor como usuario root.
* Detener el servicio de MySQL. Esto lo puedes hacer con uno de los siguientes comandos:
    * `service mysqld stop`
    * `/etc/init.d/mysqld stop`
* `mysqld_safe --skip-grant-tables --skip-networking&`, Iniciar el servicio de MySQL en modo abierto con el siguiente comando:

> Este comando, con la opción –skip-grant-tables, iniciará MySQL sin emplear el sistema de privilegios, por lo que tendrás acceso ilimitado a todas las bases de datos.La opción –skip-networking hará que se dejen de escuchar conexiones TCP/IP externas, lo que evitará problemas externos durante el cambio.

* `mysql -u root`, Una vez iniciado MySQL, deberás acceder con el usuario “root”.
* `mysql> use mysql;`, Una vez dentro de MySQL, tendrás que acceder a la base de datos MySQL, que es donde tendrás que realizar el cambio de la contraseña.
* `mysql> UPDATE user SET password=PASSWORD('contraseña') WHERE user='root';`, Dentro de la base de datos MySQL, podrás lanzar la siguiente query que realizará el cambio de contraseña:
* `mysql> exit`, Y cuando termine podrás salir del servidor MySQL con:
* Finalmente tendrás reiniciar el servicio de MySQL para que inicie en modo normal:
    * `service mysqld restart`
    * `/etc/init.d/mysqld restart`

Una vez realizados los pasos anteriores, ya habrás modificado la contraseña del usuario “root” de MySQL. El comando para realizar el cambio de contraseña se puede emplear para los usuarios que quieras, sin embargo es necesario iniciar MySQL sin el sistema de privilegios para realizar el cambio del usuario “root” si has perdido tu contraseña.

---


## Configuración de los accesos

```
mysql -u root -p
Enter password:
Welcome to the MySQL monitor. Commands end with ; or \g.
Your MySQL connection id is 60
Server version: 5.5.31-0+wheezy1 (Debian)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.
Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
mysql>
```

* Entramos al promt de MySQL y vamos a eliminar el acceso público de los usuarios locales.
```
DROP USER ''@'localhost';
 DROP USER ''@'localhost.localdomain';
```

> Ahora sólo tendrán acceso a MySQL el usuario root y los usuarios que vas a crear.

* Y para crear un usuario solo tienes que teclear el siguiente comando:
`CREATE USER 'udemo'@'localhost' IDENTIFIED BY  'clave';`.
     * ‘udemo’ va a ser el nombre de usuario que vas a crear
     * ‘clave’ es la contraseña.
* Para que un usuario pueda almacenar información requiere una base de datos y puedes crearla con el siguiente comando: `CREATE DATABASE IF NOT EXISTS 'db-demo';`. Donde 'db-demo' es el nombre que le asignarás a la base de datos.

Esto no es todo lo que debes hacer pues aunque ya tienes un usuario y una base de datos es necesario que le otorgues permisos a ese usuario para que pueda usar esa base de datos. No entraré en detalles sobre este tema ya que es muy extenso pero en resumen le otorgaremos «todos los permisos» posibles al usuario sobre la base de datos que se ha creado. Para hacerlo puedes utilizar este comando:
`GRANT ALL PRIVILEGES ON  `db-demo` . * TO  'test'@'localhost';`
* `quit;`, para regresar al promt de Linux solo debes salir de MySQL, para hacerlo teclea:
