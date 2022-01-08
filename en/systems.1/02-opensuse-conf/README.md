```
Challenge name : 02-opensuse-conf
Date           : 2019-09-14 10:41:47 +0100
Teuton version : 2.1.0
```
---
# README.md

Required hosts:
1. opensuse

Required configuration params:
* firstname
* lastname1
* number

## OpenSUSE external configurations

Go to LOCALHOST host, and do next:
* ping VALUE (opensuse_ip) OK
* SSH port 22 open on VALUE (opensuse_ip)

## OpenSUSE student personal configurations

Go to OPENSUSE host, and do next:
* Checking hostname -a equal to LASTNAME1NUMBERg1.
* Hostname -d equal curso1617
* Hostname -f equal to <LASTNAME1NUMBERg1.curso1617>
* User <FIRSTNAME> exists
* User <FIRSTNAME> with not empty password 
* User <FIRSTNAME> logged

## OpenSUSE network configurations

Go to OPENSUSE host, and do next:
* Gateway configured with 172.19.0.1 (gateway_ip).
* WWW routing working.
* DNS configuration working.
