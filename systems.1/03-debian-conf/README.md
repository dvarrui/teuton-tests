```
Challenge name : 03-debian-conf
Date           : 2019-08-31 20:57:45 +0100
```
---
# README.md

Params configured for every case:
* debian_ip
* debian_password
* debian_username
* domain
* firstname
* gateway_ip
* ip_prefix
* ip_sufix
* lastname1
* number

## Debian external configurations

Go to host LOCALHOST, and do next:
* ping to VALUE (debian_ip) ok
* SSH port 22 open on VALUE (debian_ip)

## Debian student personal configurations

Go to host DEBIAN, and do next:
* Set hostname -a equal LASTNAME1NUMBERd1
* Set hostname -d equal VALUE (domain).
* Set hostname -f equal LASTNAME1NUMBERd1.DOMAIN.
* User <FIRSTNAME> exists
* User <FIRSTNAME> with not empty password 
* User <FIRSTNAME> logged

## Debian network configurations

Go to host DEBIAN, and do next:
* Gateway IP VALUE (gateway_ip)
* WWW routing working
* DNS configuration working
