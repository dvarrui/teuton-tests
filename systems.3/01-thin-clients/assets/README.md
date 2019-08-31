```
Challenge name : 01-thin-clients
Date           : 2019-08-31 21:32:50 +0100
```
---
# README.md

Params configured for every case:
* domain
* host1_hostname
* host1_ip
* host1_password
* host1_username
* ip_prefix
* ip_sufix
* lastname1
* number

## Configure hostname

Go to host LOCALHOST, and do next:
* Ensure SSH port open on VALUE (host1_ip)
Go to host HOST1, and do next:
* Set hostname to HOST1_HOSTNAME.

## Create users

Go to host HOST1, and do next:
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

Go to host HOST1, and do next:
* Install package tlsp
* Build image

## Run the services

Go to host HOST1, and do next:
* Run service dhcpd.
* Run service tftpd.
* Define INTERFACES=eth1 into /etc/default/isc-dhcp-server.
* Define TFTP_ADDRESS as 192.168.0.1:69 into /etc/default/tftpd-pha.

## Running thin clients

Go to host HOST1, and do next:
* Boot thin client 192.168.0.20
* Thin client 192.168.0.20 boots from LSTP server
* Thin client 192.168.0.20 get IP from DHCP server
* Boot thin client 192.168.0.21
* Thin client 192.168.0.21 boots from LSTP server
* Thin client 192.168.0.21 get IP from DHCP server
