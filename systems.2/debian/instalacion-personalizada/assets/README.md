```
Test name : instalacion-personalizada
Date      : 2019-08-06 19:05:25 +0100
```
---
# README.md

Params configured for every case:
* domain
* firstname
* host1_hostname
* host1_ip
* host1_password
* host1_username
* lastname
* number
* username

## HOST configurations

Go to host LOCALHOST, and do next:
* Ensure SSH port is open on VALUE (host1_ip)
Go to host LOCALHOST, and do next:
* Update hostname with VALUE (host1_hostname)

## Network configuration

Go to host HOST1, and do next:
* Network gateway configuration working
* Network DNS configuration working

## GNULinux user configuration

Go to host HOST1, and do next:
* Create user VALUE (username)
* User VALUE (username) need a no empty password
* Log into using VALUE (username) user

## Disk size

Go to host HOST1, and do next:
* Disk sda size <10G>

## Partitions size and type

Go to host HOST1, and do next:
* Partition sda5 mounted on <[SWAP]>
* Partition sda5 size near at <953M>
* Partition sda6 mounted on </>
* Partition sda6 size near at <6,5G>
* Partition sda7 mounted on </home>
* Partition sda7 size near at <476M>
* Partition sda8 mounted on <sda8>
* Partition sda8 size near at <94M>
* Partition <sda6> with type <ext4>
* Partition <sda7> with type <ext3>
* Partition <sda8> unmounted
