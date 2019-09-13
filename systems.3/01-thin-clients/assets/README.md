```
Challenge name : 01-thin-clients
Date           : 2019-09-14 00:45:26 +0100
```
---
# README.md

Required hosts:
1. host1

Params configured for every case:
* lastname1
* number

## Configure hostname

Go to LOCALHOST host, and do next:
* Ensure SSH port open on VALUE (host1_ip)
Go to HOST1 host, and do next:
* Set hostname to HOST1_HOSTNAME.

## Create users

Go to HOST1 host, and do next:
* Create user LASTNAME11
* Set password to user <LASTNAME11
* Open session with user LASTNAME11
* Create user LASTNAME12
* Set password to user <LASTNAME12
* Open session with user LASTNAME12
* Create user LASTNAME13
* Set password to user <LASTNAME13
* Open session with user LASTNAME13

## Install sofware

Go to HOST1 host, and do next:
* Install package tlsp
* Build image

## Run the services

Go to HOST1 host, and do next:
* Run service dhcpd.
* Run service tftpd.
* Define INTERFACES=eth1 into /etc/default/isc-dhcp-server.
* Define TFTP_ADDRESS as 192.168.0.1:69 into /etc/default/tftpd-pha.

## Running thin clients

Go to HOST1 host, and do next:
* Boot thin client 192.168.0.20
* Thin client 192.168.0.20 boots from LSTP server
* Thin client 192.168.0.20 get IP from DHCP server
* Boot thin client 192.168.0.21
* Thin client 192.168.0.21 boots from LSTP server
* Thin client 192.168.0.21 get IP from DHCP server
