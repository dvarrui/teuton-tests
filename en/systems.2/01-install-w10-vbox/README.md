```
Test unit name : 01-install-w10-vbox
Date           : 2022-06-29 00:04:44 +0100
Teuton version : 2.3.6
```

# 01-install-w10-vbox

### Required hosts

| ID | Host | Configuration |
| --- | --- | --- |
| 1 | HOST1 |  |

> NOTE: SSH Service installation is required on every host.

### Required params
* host1_ip
* host1_password
* host1_username

> NOTE: Save every 'param: value' into config file.

## Install windows 10 on a vbox virtual machine


Go to [HOST1](#required-hosts) host, and do next:
* Set 4GB of RAM memory for the virtual machine.
* Set a 25GB hard disk drive for the virtual machine.
* Install Windows 10 Pro on the virtual machine.

## Windows 10 configuration


Go to [HOST1](#required-hosts) host, and do next:
* Create user Alumno and make him member of Administradores local group.
* Activate Windows 10.
* Set IDP as computer name.
* Set TimeZone to UTC+00:00 (Dublin, Edimburgh, Lisbon, London).
* Install Guest Additions on the virtual machine.
