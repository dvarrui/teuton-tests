```
Challenge name : 04-winserver-conf
Date           : 2019-09-14 10:42:23 +0100
Teuton version : 2.1.0
```
---
# README.md

Required hosts:
1. winserver

Required configuration params:
* firstname
* lastname1
* number

## Windows Server external configuration

Go to LOCALHOST host, and do next:
* Must be conectivity with VALUE (winserver_ip)>
* Host WINSERVER_IP need port 22/tcp open
* Host WINSERVER_IP need port 139/tcp open

## Windows Server Student personal configurations

Go to WINSERVER host, and do next:
* Exist FIRSTNAME home dir
* Windows COMPUTERNAME

## Windows Server version

Go to WINSERVER host, and do next:
* Windows version is 6.1 (winserver_version)
* Windows ProductName is Windows 2008 Server (winserver_productname)

## Windows Server network configurations

Go to WINSERVER host, and do next:
* Gateway IP is 172.19.0.1 (gateway_ip).
* WWW routing working
* DNS working
