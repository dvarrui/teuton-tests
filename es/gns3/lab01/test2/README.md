```
Date   : 2025-04-06 20:23:26 +0100
Teuton : 2.9.3
```

# Test: test2

### Required hosts

| ID  | Host | Configuration |
| --- | ---- | ------------- |
| 1 | HOST |  |

> NOTE: SSH Service installation is required on every host.

### Required params
* gns3server_ip
* host_ip
* host_password
* host_username
* pc1_ip
* pc2_ip
* project_path

## Revisar el contenido del proyecto gns3

Go to [HOST](#required-hosts) host, and do next:
* (x1.0) Crear el proyecto GNS3 <PROJECT_PATH>.
* (x1.0) Crear el nodo <PC1>.
* (x1.0) Crear el nodo <PC2>.
* (x1.0) Crear el nodo <Switch1>.

## Configurar las interfaces de red
NOTA:
- GNS3 debe estar iniciado con el proyecto abierto
- Los dispositivos deben estar iniciados

Go to [HOST](#required-hosts) host, and do next:
* (x1.0) Configurar pc1 ip <PC1_IP>.
* (x1.0) Configurar pc2 ip <PC2_IP>.

## Comprobar la conectividad entre los dispositivos
NOTA:
- GNS3 debe estar iniciado con el proyecto abierto
- Los dispositivos deben estar iniciados

Go to [HOST](#required-hosts) host, and do next:
* (x1.0) ping pc1 -> pc2.
* (x1.0) ping pc2 -> pc1.

---
# ANEXO

## Params

Created during execution:

| Param |
| ----- |
|project_file|
|project_dir|
|pc1_console|
|pc2_console|
