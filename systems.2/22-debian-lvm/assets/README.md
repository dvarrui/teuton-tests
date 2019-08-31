```
Challenge name : 22-debian-lvm
Date           : 2019-08-31 16:40:05 +0100
```
---
# README.md

Params configured for every case:
* firstname
* lastname1
* linux_domain
* linux_fqdn
* linux_hostname
* linux_ip
* linux_password
* linux_username
* lvXXdatos
* lvXXextra
* lvXXraiz
* lvXXswap
* number
* vgXXdebian
* vgXXextra

## External connectivity

Go to host LOCALHOST, and do next:
* Host VALUE (linux_ip) responds to ping command
* Access SSH (port 22) opened on VALUE (linux_ip)

## Host configuration

Go to host LINUX, and do next:
* Checking hostname -a VALUE (linux_hostname)
* Checking hostname -d VALUE (linux_domain)
* Checking hostname -f VALUE (linux_fqdn)

## User configuration

Go to host LINUX, and do next:
* Create user VALUE (firstname)

## Checking partitions on Debian (linux)

Go to host LINUX, and do next:
* Disk sdb with more than 1 partition
* Disk sdc with more than 3 partitions

## Checking /boot partition on Debian (linux)

Go to host LINUX, and do next:
* Ensure sda1 partition mounted on /boot
* Verifing /boot partition size
* Ensure /boot partition format is ext2

## Settings


## linux: vgXXdebian

Go to host LINUX, and do next:
* Create VG called VALUE (vgXXdebian)
* Create LV called VALUE (lvXXraiz) into VG VALUE (vgXXdebian)
* Create LV called VALUE (lvXXswap) into VG VALUE (vgXXdebian)
* Create LV called VALUE (lvXXdatos) into VG VALUE (vgXXdebian)

## Logical Volumes on Debian (linux)

Go to host LINUX, and do next:
* LV VALUE (lvXXdatos) with ext3 format
* LV VALUE (lvXXraiz) with ext4 format

## linux: Cheking VG vgXXextra and their LV.

Go to host LINUX, and do next:
* Create VG called VALUE (vgXXextra)
* Create LV called VALUE (lvXXextra) into VG VALUE (vgXXextra)
