```
Challenge name : 03-ssh.dev
Date           : 2019-09-14 00:36:50 +0100
```
---
# README.md

Required hosts:
1. client1
2. server1

Params configured for every case:
* client1_hostname
* client1_ip
* client2_hostname
* client2_ip
* lastname1
* number
* server1_hostname
* server1_ip
* username

## OpenSUSE: external configurations

Go to LOCALHOST host, and do next:
* Ping to SERVER1_IP working
* Open SSH port 22 on VALUE (server1_ip)
* Ping to CLIENT1_IP working
* Open SSH port 22 on VALUE (client1_ip)

## OpenSUSE: student configurations

Go to SERVER1 host, and do next:
* Set hostname to SERVER1_HOSTNAME
* Set domain to curso1819
* Set host FQDN equal to SERVER1_HOSTNAME.curso1819
* Create user USERNAME
Go to CLIENT1 host, and do next:
* Set hostname to CLIENT1_HOSTNAME
* Set domain to curso1819
* Set host FQDN equal to CLIENT1_HOSTNAME.curso1819
* Create user VALUE (username)

## OpenSUSE: network configurations

Go to SERVER1 host, and do next:
* Set Gateway to 172.19.0.1
* Ensure WWW routing is working
Go to CLIENT1 host, and do next:
* Ensure DNS is working
* Set Gateway to 172.19.0.1
* Ensure WWW routing is working
* Ensure DNS is working

## Host/IP associations

Go to SERVER1 host, and do next:
* Define host/IP association for VALUE (client1_hostname)
* Define host/IP association for CLIENT2_HOSTNAME

## Defining more users

Go to SERVER1 host, and do next:
* Create user LASTNAME11 into SSH Server
* Create user LASTNAME12 into SSH Server
* Create user LASTNAME13 into SSH Server
* Create user LASTNAME14 into SSH Server

## SSH access without passwords

Go to SERVER1 host, and do next:
* Authorize user USERNAME@ssh-client1 to access user LASTNAME14@ssh-server

## Configuring remoteapp

Go to SERVER1 host, and do next:
* Create group remoteapp

## SSH Client A: Configuration

Go to CLIENT1 host, and do next:
* Create public key for VALUE (username)
* Define host/IP association for VALUE (server1_hostname)
* Define host/IP association for VALUE (client2_hostname)
