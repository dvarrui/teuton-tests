```
Challenge name : 01-windows-conf
Date           : 2019-08-31 17:58:30 +0100
```
---
# README.md

Params configured for every case:
* firstname
* gateway_ip
* host1_ip
* host1_password
* host1_productname
* host1_username
* host1_version
* ip_prefix
* ip_sufix
* lastname1
* number

## Windows external configuration

Go to host LOCALHOST, and do next:
* Conection with VALUE (host1_ip) working
* Windows HOST1_IP port 22/tcp must be opened
* Windows HOST1_IP port 139/tcp must be opened

## Windows Student personal configurations

Go to host HOST1, and do next:
* User FIRSTNAME home dir
* Windows COMPUTERNAME equal to LASTNAME1NUMBERw1

## Windows version

Go to host HOST1, and do next:
* Windows version VALUE (host1_version)
* Windows ProductName VALUE (host1_productname)

## Windows network configurations

Go to host HOST1, and do next:
* Gateway IP equal to VALUE (gateway_ip)
* Internet routing working
* DNS configuration working
