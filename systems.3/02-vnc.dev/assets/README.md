```
Challenge name : 02-vnc.dev
Date           : 2019-09-14 11:26:20 +0100
Teuton version : 2.1.0
```
---
# README.md

Required hosts:
1. DEBIAN <- ip=172.19.NUMBER.41 username=root 

> NOTE: SSH Service installation is required on every host.

Required configuration params:
* debian_password
* firstname
* lastname1
* number

## Debian configuration

Go to DEBIAN host, and do next:
* Set Hostname to VALUE (debian_hostname)
* Set Domainname to curso1617
* Crear user FIRSTNAME
* Define OpenSuse(Hostname and IP) into /etc/hosts.

---
# ANEXO

Global parameters that can be modified:
* ip_prefix       = 172.19.
* domain          = curso1617
