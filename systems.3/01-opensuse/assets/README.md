```
Challenge name : 01-opensuse
Date           : 2019-09-14 23:24:33 +0100
Teuton version : 2.1.0
```
---
# README.md

### Required hosts

| ID | Host | Configuration |
| -- | ---- | ------------- |
|1|HOST1|ip=172.19.0.31, username=root|

> NOTE: SSH Service installation is required on every host.

### Required params
* firstname
* host1_password
* number

> NOTE:
> * Teuton software must known this information.
> * Save them into challenge config file.

## General


Go to [HOST1](#required-hosts) host, and do next:
* Open SSH port on HOST1_IP

## User configuration


Go to [HOST1](#required-hosts) host, and do next:
* Create user FIRSTNAME.
* Set password to user FIRSTNAME.
* Open session with user FIRSTNAME.

## Network configuration


Go to [HOST1](#required-hosts) host, and do next:
* Ensure routing is working.
* Ensure DNS resolution is working.

## Hostname configuration


Go to [HOST1](#required-hosts) host, and do next:
* Set hostname to ssh-serverNUMBERq.

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| ------------ | ----- |
|ip_prefix|172.19.|
|ip_sufix|.31|

## Created params

Params created during challenge execution:

| Created params | Value |
| -------------- | ----- |
|host1_ip|172.19.0.31|
