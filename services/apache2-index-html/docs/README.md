```
Test unit name : apache2-index-html
Date           : 2022-01-05 21:41:20 +0000
Teuton version : 2.2.1
```

# apache2-index-html

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | HOST1 |  |

> NOTE: SSH Service installation is required on every host.

### Required params
* host1_ip
* host1_password
* host1_username
* hostname
* username

> NOTE: Save every ':param: value' into config file.

## Configuración de red


Go to [HOST1](#required-hosts) host, and do next:
* Configuración del servidor DNS funcionando correctamente.
* Gateway funcionando correctamente.
* Modificar hostname con [hostname](#required-params).

## Configuración del servidor web


Go to [HOST1](#required-hosts) host, and do next:
* (x5.0) El servicio web apache2 debe estar en ejecución.
* (x5.0) Crear el fichero index.html.
* (x5.0) Incluir el nombre de usuario [username](#required-params) dentro de index.html.
