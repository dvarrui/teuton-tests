```
Challenge name : 04-winserver-conf
Date           : 2019-08-31 21:09:41 +0100
```
---
# README.md

Params configured for every case:
* firstname
* gateway_ip
* ip_prefix
* ip_sufix
* lastname1
* number
* winserver_ip
* winserver_password
* winserver_productname
* winserver_username
* winserver_version

## Windows Server external configuration

Go to host LOCALHOST, and do next:
* Must be conectivity with VALUE (winserver_ip)>
* Host WINSERVER_IP need port 22/tcp open
* Host WINSERVER_IP need port 139/tcp open

## Windows Server Student personal configurations

Go to host WINSERVER, and do next:
* Exist FIRSTNAME home dir
* Windows COMPUTERNAME

## Windows Server version

Go to host WINSERVER, and do next:
* Windows version is VALUE (winserver_version)
* Windows ProductName is VALUE (winserver_productname)

## Windows Server network configurations

Go to host WINSERVER, and do next:
* Gateway IP is VALUE (gateway_ip).
* WWW routing working
* DNS working
