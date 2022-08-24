```
Test unit name : 04-winserver-conf
Date           : 2022-06-28 23:59:20 +0100
Teuton version : 2.3.6
```

# 04-winserver-conf

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | WINSERVER | ip=172.19.0.21, username=teuton |

> NOTE: SSH Service installation is required on every host.

### Required params
* firstname
* lastname1
* number
* winserver_password

> NOTE: Save every 'param: value' into config file.

## Windows server external configuration


Go to [LOCALHOST](#required-hosts) host, and do next:
* Must be conectivity with [winserver_ip](#created-params)>.
* Host WINSERVER_IP need port 22/tcp open.
* Host WINSERVER_IP need port 139/tcp open.

## Windows server student personal configurations


Go to [WINSERVER](#required-hosts) host, and do next:
* Exist FIRSTNAME home dir.
* Windows COMPUTERNAME.

## Windows server version


Go to [WINSERVER](#required-hosts) host, and do next:
* Windows version is [6.1](#global-params).
* Windows ProductName is [Windows 2008 Server](#global-params).

## Windows server network configurations


Go to [WINSERVER](#required-hosts) host, and do next:
* Gateway IP is [172.19.0.1](#global-params).
* WWW routing working.
* DNS working.

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| --- | --- |
|ip_prefix|172.19.|
|ip_sufix|.21|
|winserver_version|6.1|
|winserver_productname|Windows 2008 Server|
|gateway_ip|172.19.0.1|

## Created params

Params created during challenge execution:

| Created params | Value |
| --- | --- |
|winserver_ip|172.19.0.21|
