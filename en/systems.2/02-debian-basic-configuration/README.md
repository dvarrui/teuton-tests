```
Test unit name : 02-debian-basic-configuration
Date           : 2022-01-11 12:35:05 +0000
Teuton version : 2.2.1
```

# 02-debian-basic-configuration

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | HOST1 | username=root |

> NOTE: SSH Service installation is required on every host.

### Required params
* host1_ip
* host1_password
* lastname1
* username

> NOTE: Save every ':param: value' into config file.

## Access to debian ssh service


Go to [LOCALHOST](#required-hosts) host, and do next:
* Ensure SSH access to [host1_ip](#required-params) IP.

## Gnulinux user definitions


Go to [HOST1](#required-hosts) host, and do next:
* User <USERNAME> exists.
* Users <USERNAME> with not empty password .
* User <USERNAME> logged.

## Debian hostname configuration


Go to [HOST1](#required-hosts) host, and do next:
* Checking hostname [host1_hostname](#created-params).

## Network configuration


Go to [HOST1](#required-hosts) host, and do next:
* Ensure Gateway configuration is working.
* Ensure network DNS configuration is working.

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| --- | --- |
|domain|curso2021|

## Created params

Params created during challenge execution:

| Created params | Value |
| --- | --- |
|host1_hostname|LASTNAME1d.curso2021|
