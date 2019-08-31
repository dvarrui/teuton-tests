```
Challenge name : 13-win-instalacion-dual
Date           : 2019-08-31 16:10:56 +0100
```
---
# README.md

Params configured for every case:
* dominio
* firstname
* lastname1
* linux1_ip
* linux1_password
* linux1_username
* number
* opensuse1_hostname
* opensuse1_ip
* opensuse1_password
* opensuse1_username

## Setting OpenSUSE Settings


## Opensuse HOSTNAME configurations

Go to host OPENSUSE1, and do next:
* Checking hostname OPENSUSE1_HOSTNAME

## Ensure UNIQUE values for opensuse1


## Settings


## Check GNU/Linux network configuration

Go to host LINUX1, and do next:
* Gateway configuration working
* DNS configuration working

## GNULinux user definitions

Go to host LINUX1, and do next:
* User FIRSTNAME exists
* User FIRSTNAME with not empty password 
* User FIRSTNAME logged

## Disk size

Go to host OPENSUSE1, and do next:
* Disk sda size <18>

## Partitions size and type

Go to host OPENSUSE1, and do next:
* Partition sda1 mounted on <sda1>
* Partition sda1 size <11,7G>
* Partition sda2 mounted on <sda2>
* Partition sda2 size <100M>
* Partition sda5 mounted on <[SWAP]>
* Partition sda5 size <500M>
* Partition sda6 mounted on </home>
* Partition sda6 size <100M>
* Partition sda7 mounted on </>
* Partition sda7 size <5G>
* Partition sda6 type ext3
* Partition sda7 type ext4
