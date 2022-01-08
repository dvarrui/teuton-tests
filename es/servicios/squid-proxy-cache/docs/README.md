```
Test unit name : squid-proxy-cache
Date           : 2022-01-08 08:00:07 +0000
Teuton version : 2.2.1
```

# squid-proxy-cache

## Host configuration


Go to [LOCALHOST](#required-hosts) host, and do next:
* DNS OK.

## Instalación de squid


Go to [LOCALHOST](#required-hosts) host, and do next:
* Servicio activo.
* Servicio en el puerto 3128.

## Configuración de squid


Go to [LOCALHOST](#required-hosts) host, and do next:
* Squid port <3128>.
* Configurar usuario <proxy>.
* Configurar group <proxy>.
* cache mem <100 MB>.
* cache dir 500 MB.
* access_log.

## Acceso del cliente squid


Go to [LOCALHOST](#required-hosts) host, and do next:
* URL Web URL access.
