```
Test unit name : 02-opensuse-conf
Date           : 2022-06-28 23:54:12 +0100
Teuton version : 2.3.6
```

# 02-opensuse-conf

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | OPENSUSE | ip=172.19.0.31, username=root |

> NOTE: SSH Service installation is required on every host.

### Required params
* firstname
* lastname1
* number
* opensuse_password

> NOTE: Save every 'param: value' into config file.

## Opensuse external configurations


Go to [LOCALHOST](#required-hosts) host, and do next:
* ping [opensuse_ip](#created-params) OK.
* SSH port 22 open on [opensuse_ip](#created-params).

## Opensuse student personal configurations


Go to [OPENSUSE](#required-hosts) host, and do next:
* Checking hostname -a equal to LASTNAME1NUMBERg1.
* Hostname -d equal curso1617.
* Hostname -f equal to <LASTNAME1NUMBERg1.curso1617>.
* User <FIRSTNAME> exists.
* User <FIRSTNAME> with not empty password .
* User <FIRSTNAME> logged.

## Opensuse network configurations


Go to [OPENSUSE](#required-hosts) host, and do next:
* Gateway configured with [172.19.0.1](#global-params).
* WWW routing working.
* DNS configuration working.

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| --- | --- |
|ip_prefix|172.19.|
|ip_sufix|.31|
|domain|curso1617|
|gateway_ip|172.19.0.1|

## Created params

Params created during challenge execution:

| Created params | Value |
| --- | --- |
|opensuse_ip|172.19.0.31|
