```
Challenge name : 31-debian-rsyslog
Date           : 2019-08-31 17:37:41 +0100
```
---
# README.md

Params configured for every case:
* domain
* firstname
* host1_ip
* host1_password
* host1_username
* host2_ip
* lastname1
* number

## Debian configuration: host1

Go to host LOCALHOST, and do next:
* ping HOST1_IP (debian) OK
* SSH port 22 on VALUE (host1_ip) open
Go to host HOST1, and do next:
* Checking hostname -a equal LASTNAME1NUMBERd1.
* Checking hostname -d equal DOMAIN.
* Checking hostname -f equal LASTNAME1NUMBERd1.DOMAIN.
* User <FIRSTNAME> exists
* User FIRSTNAME with not empty password 
* User <FIRSTNAME> had logged

## Configurations host2

Go to host LOCALHOST, and do next:
* ping HOST2_IP (ws2012) OK
* netbios-ssn service working on VALUE (host2_ip)

## webmin_on_host1

Go to host HOST1, and do next:
* Webmin installed
* Executing Webmin
* Webmin working on port 10000

## Rsyslog on host1

Go to host HOST1, and do next:
* Exist rsyslog configuration file /etc/rsyslog.d/FIRSTNAME.conf
* Exist /var/log/FIRSTNAME/prueba-local.log log file
* Configure /var/log/FIRSTNAME/prueba-local.log with Rsyslog, to receave local0.info log messages

## Configure Rsyslog/logrotate into host1

Go to host HOST1, and do next:
* Exist logrotate configuration file /etc/logrotate.d/FIRSTNAME
* Logrotate configuration contains our log file
