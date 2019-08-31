```
Challenge name : 02-opensuse-conf
Date           : 2019-08-31 20:40:47 +0100
```
---
# README.md

Params configured for every case:
* domain
* firstname
* gateway_ip
* ip_prefix
* ip_sufix
* lastname1
* number
* opensuse_ip
* opensuse_password
* opensuse_username

## OpenSUSE external configurations

Go to host LOCALHOST, and do next:
* ping VALUE (opensuse_ip) OK
* SSH port 22 open on VALUE (opensuse_ip)

## OpenSUSE student personal configurations

Go to host OPENSUSE, and do next:
* Checking hostname -a equal to LASTNAME1NUMBERg1.
* Hostname -d equal DOMAIN
* Hostname -f equal to <LASTNAME1NUMBERg1.DOMAIN>
* User <FIRSTNAME> exists
* User <FIRSTNAME> with not empty password 
* User <FIRSTNAME> logged

## OpenSUSE network configurations

Go to host OPENSUSE, and do next:
* Gateway configured with VALUE (gateway_ip).
* WWW routing working.
* DNS configuration working.
