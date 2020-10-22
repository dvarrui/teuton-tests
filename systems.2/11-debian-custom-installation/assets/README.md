```
Test unit name : 11-debian-custom-installation
Date           : 2020-10-22 18:00:34 +0100
Teuton version : 2.2.0
```

# 11-debian-custom-installation

### Required hosts

| ID | Host | Configuration |
| -- | ---- | ------------- |
|1|HOST1|username=root|

> NOTE: SSH Service installation is required on every host.

### Required params
* firstname
* host1_ip
* host1_password
* lastname
* number

> NOTE: Save every ':param: value' into config file.

## Disk and partitions


Go to [HOST1](#required-hosts) host, and do next:
* Disk sda size <10G>.
* Partition sda5 mounted on <[SWAP]>.
* Partition sda5 size near at <953M>.
* Partition sda6 mounted on </>.
* Partition sda6 size near at <6,5G>.
* Partition sda7 mounted on </home>.
* Partition sda7 size near at <476M>.
* Partition sda8 mounted on <sda8>.
* Partition sda8 size near at <94M>.
* Partition <sda6> with type <ext4>.
* Partition <sda7> with type <ext3>.
* Partition <sda8> unmounted.

## Host configurations


Go to [LOCALHOST](#required-hosts) host, and do next:
* Ensure SSH port is open on [host1_ip](#required-params).

Go to [HOST1](#required-hosts) host, and do next:
* Update hostname with [host1_hostname](#created-params).

## Network configuration


Go to [HOST1](#required-hosts) host, and do next:
* Network gateway configuration working.
* Network DNS configuration working.

## Gnu/linux user configuration


Go to [HOST1](#required-hosts) host, and do next:
* Create user [username](#created-params).
* User [username](#created-params) need a no empty password.
* Log into using [username](#created-params) user.

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
|host1_hostname|LASTNAMENUMBERd1.curso2021|
|username|FIRSTNAME|
