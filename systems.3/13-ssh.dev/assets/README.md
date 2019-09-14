```
Challenge name : 03-ssh.dev
Date           : 2019-09-14 20:42:13 +0100
Teuton version : 2.1.0
```
---
# README.md

### Required hosts

| ID | Host | Configuration |
| -- | ---- | ------------- |
|1|SERVER1|ip=172.19.0.31, username=root|
|2|CLIENT1|ip=172.19.0.32, username=root|

> NOTE: SSH Service installation is required on every host.

### Required params
* client1_password
* lastname1
* number
* server1_password
* username

> NOTE:
> * Teuton software must known this information.
> * Save them into challenge config file.

## OpenSUSE: external configurations

Ensure that the machine is accessible from the outside.


Go to [LOCALHOST](#required-hosts) host, and do next:
* Ping to [server1_ip](#created-params) working.
* Open SSH port 22 on [server1_ip](#created-params).
* Ping to [client1_ip](#created-params) working.
* Open SSH port 22 on [client1_ip](#created-params).

## OpenSUSE: student configurations

Each student must customize their machines according to the teacher's specifications.


Go to [SERVER1](#required-hosts) host, and do next:
* Set hostname to [server1_hostname](#created-params)
* Set domain to [curso1819](#global-params).
* Set host FQDN equal to SERVER1_HOSTNAME.curso1819.
* Create user [username](#required-params).

Go to [CLIENT1](#required-hosts) host, and do next:
* Set hostname to [client1_hostname](#created-params)
* Set domain to [curso1819](#global-params).
* Set host FQDN equal to CLIENT1_HOSTNAME.curso1819.
* Create user [username](#required-params).

## OpenSUSE: network configurations

Make sure the network settings are correct.


Go to [SERVER1](#required-hosts) host, and do next:
* Set Gateway to [172.19.0.1](#global-params)
* Ensure WWW routing is working.

Go to [CLIENT1](#required-hosts) host, and do next:
* Ensure DNS is working.
* Set Gateway to [172.19.0.1](#global-params)
* Ensure WWW routing is working.
* Ensure DNS is working.

## Host/IP associations

Modifing /etc/host file.


Go to [SERVER1](#required-hosts) host, and do next:
* Define host/IP association for [client1_hostname](#created-params).
* Define host/IP association for [client2_hostname](#created-params).

## Defining more users

We will create some user on SSH Sever.


Go to [SERVER1](#required-hosts) host, and do next:
* Create user LASTNAME11 into SSH Server.
* Create user LASTNAME12 into SSH Server.
* Create user LASTNAME13 into SSH Server.
* Create user LASTNAME14 into SSH Server.

## SSH access without passwords.


Go to [SERVER1](#required-hosts) host, and do next:
* Authorize user USERNAME@ssh-client1 to access user LASTNAME14@ssh-server
    * Generate id_rsa.pub for USERNAME, and authorized remote access to him.

## Configuring remoteapp


Go to [SERVER1](#required-hosts) host, and do next:
* Create group [remoteapp](#global-params).
    * Remember command groupadd...

## SSH Client A: Configuration


Go to [CLIENT1](#required-hosts) host, and do next:
* Create public key for [username](#required-params).
* Define host/IP association for [server1_hostname](#created-params).
* Define host/IP association for [client2_hostname](#created-params).

---
# ANEXO

## Global params

Global parameters that can be modified:

| Global param | Value |
| ------------ | ----- |
|ip_prefix|172.19.|
|domain|curso1819|
|gateway_ip|172.19.0.1|
|groupname|remoteapp|

## Created params

Params created during challenge execution:

| Created params | Value |
| -------------- | ----- |
|server1_hostname|ssh-serverNUMBERg|
|server1_ip|172.19.0.31|
|client1_hostname|ssh-clientNUMBERg|
|client1_ip|172.19.0.32|
|server2_hostname|ssh-serverNUMBERw|
|server2_ip|172.19.0.11|
|client2_hostname|ssh-clientNUMBERw|
|client2_ip|172.19.0.12|
