```
Test name : acl
Date      : 2019-08-08 13:20:25 +0100
```
---
# README.md

Params configured for every case:
* dominio
* firstname
* host1_hostname
* host1_ip
* host1_password
* host1_username
* lastname1
* number

## Access to Debian host

Go to host LOCALHOST, and do next:
* Open SSH port at VALUE (host1_ip)

## Debian HOST configurations

Go to host HOST1, and do next:
* Ensure hostname is VALUE (host1_hostname)

## Network configuration

Go to host HOST1, and do next:
* Ensure Gateway network configuration is working
* Ensure DNS network configuration is working

## GNULinux user definitions

Go to host HOST1, and do next:
* Create use FIRSTNAME
* User <FIRSTNAME> with not empty password 
* Open a session with user FIRSTNAME

## Activating ACL on partition

Go to host HOST1, and do next:
* Chech sda disk with 5 partitions
* Check sdb disk with 1 partition
* sdb1 part is mounted and has type ext3
* On every boot, mount sdb1 on /mnt/starwars directory

## ACL users and groups

Go to host HOST1, and do next:
* User <han> is member of rebels group
* User <luke> is member of rebels group
* User <trooper1> is member of troopers group
* User <trooper2> is member of troopers group

## Cheking ACL assigned to /mnt/starwars/endor

Go to host HOST1, and do next:
* root user is owner of /mnt/starwars/endor directory
* Ensure directory /mnt/starwars/endor ACL includes <user::rwx>
* Ensure directory /mnt/starwars/endor ACL includes <user:luke:r-x>
* Ensure directory /mnt/starwars/endor ACL includes <group:troopers:rwx>
* Ensure directory /mnt/starwars/endor ACL includes <mask::rwx>
* Ensure directory /mnt/starwars/endor ACL includes <other::--->

## Checking ACL assigned to /mnt/starwars/xwing

Go to host HOST1, and do next:
* root user is owner of /mnt/starwars/xwing directory
* Ensure directory /mnt/starwars/xwing ACL includes <user::rwx>
* Ensure directory /mnt/starwars/xwing ACL includes <user:han:rwx>
* Ensure directory /mnt/starwars/xwing ACL includes <user:luke:r-x>
* Ensure directory /mnt/starwars/xwing ACL includes <group::--->
* Ensure directory /mnt/starwars/xwing ACL includes <mask::rwx>
* Ensure directory /mnt/starwars/xwing ACL includes <other::--->
