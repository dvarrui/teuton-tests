```
Challenge name : 03-ssh.dev
Date           : 2019-09-14 20:26:55 +0100
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

**Required configuration params:**
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


Go to **LOCALHOST** host, and do next:
* Ping to **server1_ip** working.
* Open SSH port 22 on **server1_ip**.
* Ping to **client1_ip** working.
* Open SSH port 22 on **client1_ip**.

## OpenSUSE: student configurations

Each student must customize their machines according to the teacher's specifications.


Go to **SERVER1** host, and do next:
* Set hostname to **server1_hostname**
* Set domain to [curso1819](#ANEXO).
* Set host FQDN equal to SERVER1_HOSTNAME.curso1819.
* Create user **username**.

Go to **CLIENT1** host, and do next:
* Set hostname to **client1_hostname**
* Set domain to [curso1819](#ANEXO).
* Set host FQDN equal to CLIENT1_HOSTNAME.curso1819.
* Create user **username**.

## OpenSUSE: network configurations

Make sure the network settings are correct.


Go to **SERVER1** host, and do next:
* Set Gateway to [172.19.0.1](#ANEXO)
* Ensure WWW routing is working.

Go to **CLIENT1** host, and do next:
* Ensure DNS is working.
* Set Gateway to [172.19.0.1](#ANEXO)
* Ensure WWW routing is working.
* Ensure DNS is working.

## Host/IP associations

Modifing /etc/host file.


Go to **SERVER1** host, and do next:
* Define host/IP association for **client1_hostname**.
* Define host/IP association for **client2_hostname**.

## Defining more users

We will create some user on SSH Sever.


Go to **SERVER1** host, and do next:
* Create user LASTNAME11 into SSH Server.
* Create user LASTNAME12 into SSH Server.
* Create user LASTNAME13 into SSH Server.
* Create user LASTNAME14 into SSH Server.

## SSH access without passwords.


Go to **SERVER1** host, and do next:
* Authorize user USERNAME@ssh-client1 to access user LASTNAME14@ssh-server
    * Generate id_rsa.pub for USERNAME, and authorized remote access to him.

## Configuring remoteapp


Go to **SERVER1** host, and do next:
* Create group [remoteapp](#ANEXO).
    * Remember command groupadd...

## SSH Client A: Configuration


Go to **CLIENT1** host, and do next:
* Create public key for **username**.
* Define host/IP association for **server1_hostname**.
* Define host/IP association for **client2_hostname**.

---
# ANEXO

Global parameters that can be modified:

| Global param | Value |
| ------------ | ----- |
|ip_prefix|172.19.|
|domain|curso1819|
|gateway_ip|172.19.0.1|
|groupname|remoteapp|
