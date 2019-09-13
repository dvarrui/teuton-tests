```
Challenge name : 03-ssh.dev
Date           : 2019-09-13 23:09:45 +0100
```
---
# README.md

Required hosts:
[1] client1
[2] server1

Params configured for every case:
* client1_hostname
* client1_ip
* client2_hostname
* client2_ip
* domain
* gateway_ip
* groupname
* ip_prefix
* lastname1
* number
* server1_hostname
* server1_ip
* username

## Settings


## OpenSUSE: external configurations

Go to host LOCALHOST, and do next:
* Ping to VALUE (server1_ip) working
* Open SSH port 22 on VALUE (server1_ip)
* Ping to VALUE (client1_ip) working
* Open SSH port 22 on VALUE (client1_ip)

## OpenSUSE: student configurations

Go to host SERVER1, and do next:
* Set hostname to VALUE (server1_hostname)
* Set domain to VALUE (domain)
* Set host FQDN equal to SERVER1_HOSTNAME.DOMAIN
* Create user VALUE (username)
Go to host CLIENT1, and do next:
* Set hostname to VALUE (client1_hostname)
* Set domain to VALUE (domain)
* Set host FQDN equal to CLIENT1_HOSTNAME.DOMAIN
* Create user VALUE (username)

## OpenSUSE: network configurations

Go to host SERVER1, and do next:
* Set Gateway to VALUE (gateway_ip)
* Ensure WWW routing is working
Go to host CLIENT1, and do next:
* Ensure DNS is working
* Set Gateway to VALUE (gateway_ip)
* Ensure WWW routing is working
* Ensure DNS is working

## Host/IP associations

Go to host SERVER1, and do next:
* Define host/IP association for CLIENT1_HOSTNAME
* Define host/IP association for CLIENT2_HOSTNAME

## Defining more users

Go to host SERVER1, and do next:
* Create user LASTNAME11 into SSH Server
* Create user LASTNAME12 into SSH Server
* Create user LASTNAME13 into SSH Server
* Create user LASTNAME14 into SSH Server

## SSH access without passwords

Go to host SERVER1, and do next:
* Authorize user USERNAME@ssh-client1 to access user LASTNAME14@ssh-server

## Configuring remoteapp

Go to host SERVER1, and do next:
* Create group VALUE (groupname)

## SSH Client A: Configuration

Go to host CLIENT1, and do next:
* Create public key for VALUE (username)
* Define host/IP association for  VALUE (server1_hostname)
* Define host/IP association for VALUE (client2_hostname)
