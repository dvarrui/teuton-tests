```
Test unit name : 03-debian-mkdir-command
Date           : 2020-10-22 18:25:57 +0100
Teuton version : 2.2.0
```

# 03-debian-mkdir-command

### Required hosts

| ID | Host | Configuration |
| -- | ---- | ------------- |
|1|HOST1|username=root|

> NOTE: SSH Service installation is required on every host.

### Required params
* host1_ip
* host1_password
* lastname1
* username

> NOTE: Save every ':param: value' into config file.

## Hostname_configurations


Go to [LOCALHOST](#required-hosts) host, and do next:
* Checking SSH port <HOST1_IP>.

Go to [HOST1](#required-hosts) host, and do next:
* Checking hostname <LASTNAME1.curso2021>.

## User_definitions


Go to [HOST1](#required-hosts) host, and do next:
* User <USERNAME> exists.
* Users <USERNAME> with not empty password .
* User <USERNAME> logged.

## Directories and files


Go to [HOST1](#required-hosts) host, and do next:
* Exist directory </home/USERNAME/Documentos/curso2021/fuw>.
* Exist file </home/USERNAME/Documentos/curso2021/fuw/leeme.txt>.
* Content file </home/USERNAME/Documentos/curso2021/fuw/leeme.txt> with <USERNAME>.
* Exist directory </home/USERNAME/Documentos/curso2021/idp>.
* Exist file </home/USERNAME/Documentos/curso2021/idp/leeme.txt>.
* Content file </home/USERNAME/Documentos/curso2021/idp/leeme.txt> with <USERNAME>.
* Exist directory </home/USERNAME/Documentos/curso2021/lnd>.
* Exist file </home/USERNAME/Documentos/curso2021/lnd/leeme.txt>.
* Content file </home/USERNAME/Documentos/curso2021/lnd/leeme.txt> with <USERNAME>.
* Exist directory </home/USERNAME/Documentos/curso2021/lnt>.
* Exist file </home/USERNAME/Documentos/curso2021/lnt/leeme.txt>.
* Content file </home/USERNAME/Documentos/curso2021/lnt/leeme.txt> with <USERNAME>.

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| ------------ | ----- |
|domain|curso2021|

## Created params

Params created during challenge execution:

| Created params | Value |
| -------------- | ----- |
