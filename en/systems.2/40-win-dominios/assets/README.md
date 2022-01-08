```
Challenge name : 40-win-dominios
Date           : 2019-08-31 10:14:56 +0100
```
---
# README.md

Params configured for every case:
* domain
* gateway
* lastname1
* student_number
* wincli1_ip
* wincli1_password
* wincli1_productname
* wincli1_sname
* wincli1_username
* wincli2_ip
* wincli2_password
* wincli2_productname
* wincli2_sname
* wincli2_username
* winserver_ip
* winserver_password
* winserver_sname
* winserver_username

## Set internal params...


## External configuration: WinServer

Go to host LOCALHOST, and do next:
* Conection with <WINSERVER_IP>
* windserver WINSERVER_IP port 23/tcp
* windserver WINSERVER_IP port 53/tcp
* windserver WINSERVER_IP port 139/tcp
Go to host WINSERVER, and do next:
* windserver WINSERVER_IP port 389/tcp

## Internal configurations: WinServer

Go to host WINSERVER, and do next:
* winserver version
* winserver COMPUTERNAME
* winserver gateway <GATEWAY>
* winserver router OK
* winserver DNS OK
* winserver ProductName

## Ping from winserver to *

Go to host WINSERVER, and do next:
* ping winserver to VALUE (wincli1_ip)
* ping winserver to windows1_name
* ping winserver to VALUE (wincli2_ip)
* ping winserver to windows2_name

## External configurations: wincli1 and wincli2

Go to host LOCALHOST, and do next:
* Ping conection to VALUE (wincli1_ip)
* wincli1 WINCLI1_IP port 23/tcp
* wincli1 WINCLI1_IP port 135/tcp
* Ping conection to VALUE (wincli2_ip)
* wincli2 WINCLI2_IP port 23/tcp
Go to host WINCLI1, and do next:
* wincli2 WINCLI2_IP port 135/tcp

## Internal configurations: wincli1 and wincli2

Go to host WINCLI1, and do next:
* wincli1 version
* wincli1 COMPUTERNAME
* wincli1 enlace VALUE (gateway)
* wincli1 router OK
* wincli1 DNS OK
Go to host WINCLI2, and do next:
* wincli1 ProductName
* wincli2 version
* wincli2 COMPUTERNAME
* wincli2 enlace VALUE (gateway)
* wincli2 router OK
* wincli2 DNS OK
* wincli2 ProductName

## Ping from wincli1 to *

Go to host WINCLI1, and do next:
* ping wincli1 to VALUE (winserver_ip)
* ping wincli1 to VALUE (winserver_sname)
* ping wincli1 to VALUE (wincli2_ip)
* ping wincli1 to VALUE (wincli2_sname)

## Ping from wincli2 to *

Go to host WINCLI2, and do next:
* ping wincli2 to VALUE (winserver_ip)
* ping wincli2 to VALUE (winserver_sname)
* ping wincli2 to VALUE (wincli1_ip)
* ping wincli2 to VALUE (wincli1_sname)
