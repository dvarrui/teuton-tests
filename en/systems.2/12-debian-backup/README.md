```
Test unit name : 12-debian-backup
Date           : 2023-03-14 13:46:59 +0000
Teuton version : 2.4.5
```

# 12-debian-backup

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | OPENSUSE | username=root |

> NOTE: SSH Service installation is required on every host.

### Required params
* firstname
* lastname1
* number
* opensuse_ip
* opensuse_password
* win7_ip
* ws2008_ip

> NOTE: Save every 'param: value' into config file.

## Configure w7 and w2008server


Go to [LOCALHOST](#required-hosts) host, and do next:
* ping [win7_ip](#required-params).
* ping [ws2008_ip](#required-params).
* Netbios-SSN service on [ws2008_ip](#required-params).
* Microsoft-DS service on [ws2008_ip](#required-params).

## Configure opensuse 13.2


Go to [LOCALHOST](#required-hosts) host, and do next:
* SSH port 22 on [opensuse_ip](#required-params) open.

Go to [OPENSUSE](#required-hosts) host, and do next:
* Checking hostname -a is LASTNAME1NUMBERg1.
* Checking hostname -d is curso201718.
* Checking hostname -f is LASTNAME1NUMBERg1.curso201718.

## Configure users


Go to [OPENSUSE](#required-hosts) host, and do next:
* User FIRSTNAME exists.
* User FIRSTNAME with not empty password .
* User FIRSTNAME logged.

## Create files to be saved


Go to [OPENSUSE](#required-hosts) host, and do next:
* Exist file /home/FIRSTNAME1/mydocs/manual11.txt.
* Exist file /home/FIRSTNAME1/mydocs/manual12.txt.
* Exist file /home/FIRSTNAME1/mydocs/manual13.txt.
* Exist file /home/FIRSTNAME2/mydocs/manual21.txt.
* Exist file /home/FIRSTNAME2/mydocs/manual22.txt.
* Exist file /home/FIRSTNAME2/mydocs/manual23.txt.

## Check backup output


Go to [OPENSUSE](#required-hosts) host, and do next:
* Exist directory /var/backup-99/FIRSTNAME1.
* /var/backup-99/FIRSTNAME1 owner/group is FIRSTNAME1/root.
* Permisions of /var/backup-99/FIRSTNAME1 must be drwxrwx---.

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| --- | --- |
|domain|curso201718|

## Created params

Params created during challenge execution:

| Created params | Value |
| --- | --- |
