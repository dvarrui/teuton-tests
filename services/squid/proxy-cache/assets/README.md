
```
Autora: Mari Paz
Fecha : Enero 2019
```

# A1: Proxy Caché GNU/Linux

Vamos a aprender a configurar un servidor Proxy Caché usando una MV GNU/Linux.

---

# 1. Preparativos

Máquina Virtual:
* Instalar sistema operativo Ubuntu Server.
* Configurar tarjeta de red en modo puente.

Sistema operativo
* IP `10.1.105.1XX`. Donde XX es el identificado de cada alumnos. Por ejemplo el alumno con XX=20 tendrá la IP 10.1.105.120.
* Servidor DNS `8.8.8.8`.

---

# 2. Squid

* Instalar Squid `# apt-get install squid3`.
* Consultar los apuntes para configurar la caché de Squid.
* Configurar el usuario `proxy` y grupo `proxy` como propietarios del proceso.
* Puerto `3128`
* Tamaño de la memoria caché: `100 MB`.
* Tamaño del directorio caché: `500 MB`.
* Configurar el fichero de log: `/var/log/squid/access.log`
* Reiniciar squid3, crear el directorio de caché y comprobar que no hay errores.
```
# squid3 –z
# squid3 –k parse
# service squid3 restart
```

---

# 3. Funcionamiento

Probar el funcionamiento desde la máquina real.
* Captura del fichero de configuración de Squid, donde se vean los cambios realizados.
* Configurar el proxy en el navegador del cliente y acceder a la página del instituto.
* Consultar los ficheros de logs de Squid.
* Consultar el directorio caché para ver si hay algún fichero almacenado.
