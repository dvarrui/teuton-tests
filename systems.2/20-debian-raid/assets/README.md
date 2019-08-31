```
Challenge name : 20-debian-raid
Date           : 2019-08-31 13:30:58 +0100
```
---
# README.md

Params configured for every case:
* domain
* firstname
* lastname1
* linux_ip
* linux_password
* linux_username
* number
* win_ip

## GNU/Linux configurations

Go to host LOCALHOST, and do next:
* ping VALUE (linux_ip) OK
* SSH port 22 open on VALUE (linux_ip)
Go to host LINUX, and do next:
* Checking hostname -a equal LASTNAME1NUMBERg1.
* Checking hostname -d equal DOMAIN.
* Checking hostname -f LASTNAME1NUMBERg1.DOMAIN.

## GNU/Linux user definitions

Go to host LINUX, and do next:
* User FIRSTNAME exists
* User FIRSTNAME with not empty password
* User FIRSTNAME has made loggin

## Windows configurations

Go to host LOCALHOST, and do next:
* ping WIN_IP OK
* Netbios-ssn service on VALUE (win_ip)

## GNU/Linux Raid 0


## GNU/Linux Raid 1

