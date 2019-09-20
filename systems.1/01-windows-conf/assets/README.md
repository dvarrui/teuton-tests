```
Challenge name : 01-windows-conf
Date           : 2019-09-20 10:12:59 +0100
Teuton version : 2.1.0
```
# README.md

### Required hosts

| ID | Host | Configuration |
| -- | ---- | ------------- |
|1|WIN|ip=172.18.0.11, username=teuton|

> NOTE: SSH Service installation is required on every host.

### Required params
* firstname
* lastname
* number
* win_password

> NOTE:
> * Teuton software must known this information.
> * Save them into challenge config file.

## Windows external configuration


Go to [LOCALHOST](#required-hosts) host, and do next:

* Conection with [win_ip](#created-params) working
* Windows [win_ip](#created-params) port 22/tcp must be opened
* Windows [win_ip](#created-params) port 139/tcp must be opened

## Windows Student personal configurations


Go to [WIN](#required-hosts) host, and do next:

* User [firstname](#required-params) home dir
* Windows COMPUTERNAME equal to LASTNAMENUMBERw1

## Windows version


Go to [WIN](#required-hosts) host, and do next:

* Windows version [6.1](#global-params)
* Windows ProductName [Windows 7 Professional](#global-params)

## Windows network configurations


Go to [WIN](#required-hosts) host, and do next:

* Gateway IP equal to [172.18.0.1](#global-params)
* Internet routing working
* DNS configuration working

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| ------------ | ----- |
|ip_prefix|172.18.|
|ip_sufix|.11|
|win_version|6.1|
|win_productname|Windows 7 Professional|
|gateway_ip|172.18.0.1|

## Created params

Params created during challenge execution:

| Created params | Value |
| -------------- | ----- |
|win_ip|172.18.0.11|
