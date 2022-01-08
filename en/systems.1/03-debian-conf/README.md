```
Challenge name : 03-debian-conf
Date           : 2019-09-14 10:42:06 +0100
Teuton version : 2.1.0
```
---
# README.md

Required hosts:
1. debian

Required configuration params:
* firstname
* lastname1
* number

## Debian external configurations

Go to LOCALHOST host, and do next:
* ping to VALUE (debian_ip) ok
* SSH port 22 open on VALUE (debian_ip)

## Debian student personal configurations

Go to DEBIAN host, and do next:
* Set hostname -a equal LASTNAME1NUMBERd1
* Set hostname -d equal curso1617 (domain).
* Set hostname -f equal LASTNAME1NUMBERd1.curso1617.
* User <FIRSTNAME> exists
* User <FIRSTNAME> with not empty password 
* User <FIRSTNAME> logged

## Debian network configurations

Go to DEBIAN host, and do next:
* Gateway IP 172.19.0.1 (gateway_ip)
* WWW routing working
* DNS configuration working
