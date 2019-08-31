```
Challenge name : 11-debian-backup
Date           : 2019-08-31 11:02:21 +0100
```
---
# README.md

Params configured for every case:
* domain
* firstname
* lastname1
* number
* opensuse_ip
* opensuse_password
* opensuse_username
* win7_ip
* ws2008_ip

## Configure W7 and W2008server

Go to host LOCALHOST, and do next:
* ping VALUE (win7_ip)
* ping VALUE (ws2008_ip)
* Netbios-SSN service on VALUE (ws2008_ip)
* Microsoft-DS service on VALUE (ws2008_ip)

## Configure OpenSUSE 13.2

Go to host LOCALHOST, and do next:
* SSH port 22 on VALUE (opensuse_ip) open
Go to host OPENSUSE, and do next:
* Checking hostname -a is LASTNAME1NUMBERg1
* Checking hostname -d is DOMAIN
* Checking hostname -f is LASTNAME1NUMBERg1.DOMAIN

## Configure users

Go to host OPENSUSE, and do next:
* User FIRSTNAME exists
* User FIRSTNAME with not empty password 
* User FIRSTNAME logged

## Create files to be saved

Go to host OPENSUSE, and do next:
* Exist file /home/FIRSTNAME1/mydocs/manual11.txt
* Exist file /home/FIRSTNAME1/mydocs/manual12.txt
* Exist file /home/FIRSTNAME1/mydocs/manual13.txt
* Exist file /home/FIRSTNAME2/mydocs/manual21.txt
* Exist file /home/FIRSTNAME2/mydocs/manual22.txt
* Exist file /home/FIRSTNAME2/mydocs/manual23.txt

## Check backup output

Go to host OPENSUSE, and do next:
* Exist directory /var/backup-99/FIRSTNAME1
* /var/backup-99/FIRSTNAME1 owner/group is FIRSTNAME1/root
* Permisions of /var/backup-99/FIRSTNAME1 must be drwxrwx---
