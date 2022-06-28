```
Test unit name : 03-debian-conf
Date           : 2022-06-28 23:54:40 +0100
Teuton version : 2.3.6
```

# 03-debian-conf

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | DEBIAN | ip=172.19.0.41, username=root |

> NOTE: SSH Service installation is required on every host.

### Required params
* debian_password
* firstname
* lastname1
* number

> NOTE: Save every 'param: value' into config file.

## Debian external configurations


Go to [LOCALHOST](#required-hosts) host, and do next:
* ping to [debian_ip](#created-params) ok.
* SSH port 22 open on [debian_ip](#created-params).

## Debian student personal configurations


Go to [DEBIAN](#required-hosts) host, and do next:
* Set hostname -a equal LASTNAME1NUMBERd1.
* Set hostname -d equal [curso1617](#global-params).
* Set hostname -f equal LASTNAME1NUMBERd1.curso1617.
* User <FIRSTNAME> exists.
* User <FIRSTNAME> with not empty password .
* User <FIRSTNAME> logged.

## Debian network configurations


Go to [DEBIAN](#required-hosts) host, and do next:
* Gateway IP [172.19.0.1](#global-params).
* WWW routing working.
* DNS configuration working.

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| --- | --- |
|ip_prefix|172.19.|
|ip_sufix|.41|
|domain|curso1617|
|gateway_ip|172.19.0.1|

## Created params

Params created during challenge execution:

| Created params | Value |
| --- | --- |
|debian_ip|172.19.0.41|
