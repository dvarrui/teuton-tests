```
Challenge name : 01-windows-conf
Date           : 2019-09-14 10:41:02 +0100
Teuton version : 2.1.0
```
---
# README.md

Required hosts:
1. host1

Required configuration params:
* firstname
* lastname1
* number

## Windows external configuration

Go to LOCALHOST host, and do next:
* Conection with VALUE (host1_ip) working
* Windows VALUE (host1_ip) port 22/tcp must be opened
* Windows VALUE (host1_ip) port 139/tcp must be opened

## Windows Student personal configurations

Go to HOST1 host, and do next:
* User VALUE (firstname) home dir
* Windows COMPUTERNAME equal to LASTNAME1NUMBERw1

## Windows version

Go to HOST1 host, and do next:
* Windows version 6.1 (host1_version)
* Windows ProductName Windows 7 Professional (host1_productname)

## Windows network configurations

Go to HOST1 host, and do next:
* Gateway IP equal to 172.19.0.1 (gateway_ip)
* Internet routing working
* DNS configuration working
