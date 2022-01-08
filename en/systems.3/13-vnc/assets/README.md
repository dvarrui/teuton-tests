```
Challenge name : 13-vnc
Date           : 2019-09-18 17:39:56 +0100
Teuton version : 2.1.0
```
# README.md

### Required hosts

| ID | Host | Configuration |
| -- | ---- | ------------- |
|1|WIN|ip=172.19.0.11, username=teuton|
|2|SUSE|ip=172.19.0.31, username=root|

> NOTE: SSH Service installation is required on every host.

### Required params
* lastname
* number
* suse_password
* win_password

> NOTE:
> * Teuton software must known this information.
> * Save them into challenge config file.

## Windows: external configuration

Run this commands from GNU/Linux OS system.


Go to [LOCALHOST](#required-hosts) host, and do next:

* (x0.1) Ensure ping to [win_ip](#created-params) is working.
* (x0.1) Ensure VNC port is open on [win_ip](#created-params).

## Windows: Slave VNC

Keep Open VNC connections to Slave VNC.


Go to [WIN](#required-hosts) host, and do next:

* Open VNC session from [masterwin_ip](#created-params).
* Open VNC session from [mastersuse_ip](#created-params).

## OpenSUSE: external configuration

Run this commands from GNU/Linux OS system.


Go to [LOCALHOST](#required-hosts) host, and do next:

* (x0.1) Ensure ping to [suse_ip](#created-params) is working.
* (x0.1) Ensure VNC port is open on [suse_ip](#created-params).

## OpenSUSE: Slave VNC

Keep Open VNC connections to Slave VNC.


Go to [SUSE](#required-hosts) host, and do next:

* Open VNC session from [mastersuse_ip](#created-params).
* Open VNC session from [masterwin_ip](#created-params).

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| ------------ | ----- |
|ip_prefix|172.19.|

## Created params

Params created during challenge execution:

| Created params | Value |
| -------------- | ----- |
|win_ip|172.19.0.11|
|win_hostname|LASTNAMENUMBERw|
|masterwin_ip|172.19.0.12|
|masterwin_hostname|LASTNAMENUMBERw2|
|suse_ip|172.19.0.31|
|suse_hostname|LASTNAMENUMBERg|
|mastersuse_ip|172.19.0.32|
|mastersuse_hostname|LASTNAMENUMBERg2|
