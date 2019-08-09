```
Test name : squid-proxy-cache
Date      : 2019-08-09 09:43:18 +0100
```
---
# README.md

## Host configuration

Go to host LOCALHOST, and do next:
* DNS OK

## Squid installation

Go to host LOCALHOST, and do next:
* Squid Service ON
* Squid service working on port 3128

## Squid configuration

Go to host LOCALHOST, and do next:
* Squid service working on port 3128
* Squid port <3128>
* Configure user <proxy>
* Configure group <proxy>
* cache mem <100 MB>
* cache dir 500 MB
* access_log

## Squid: client access

Go to host LOCALHOST, and do next:
* URL Web URL access
