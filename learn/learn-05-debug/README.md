```
Challenge name : learn-05-windows
Date           : 2019-10-10 23:55:00 +0100
Teuton version : 2.1.0
```
# README.md

### Required hosts

| ID | Host | Configuration |
| -- | ---- | ------------- |
|1|WINDOWS1|username=sysadmingame|

> NOTE: SSH Service installation is required on every host.

### Required params
* windows1_hostname
* windows1_ip
* windows1_password

> NOTE:
> * Teuton software must known this information!
> * Save every ':param: value' into config file.

## Windows: external configuration


Go to [LOCALHOST](#required-hosts) host, and do next:

* Localhost: Conection with [windows1_ip](#required-params)
* Localhost: netbios-ssn service on [windows1_ip](#required-params)

## Windows: internal configurations


Go to [WINDOWS1](#required-hosts) host, and do next:

* Windows version
* Windows COMPUTERNAME
* Windows router [192.168.1.1](#global-params)
* Windows router OK
* Windows DNS OK

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| ------------ | ----- |
|gateway|192.168.1.1|
|dns|8.8.4.4|

## Created params

Params created during challenge execution:

| Created params | Value |
| -------------- | ----- |
