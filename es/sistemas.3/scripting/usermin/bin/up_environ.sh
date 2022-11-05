#!/usr/bin/env bash
APPNAME=up_environ
TESTNAME=usermin
FOLDER=var/$TESTNAME/docker

title () {
  echo "==> $APPNAME: [$1] $2."
}

title 1 "Install docker" 
title 2 "Start docker service" 

title 3 "Create directory tree"
mkdir -p $FOLDER/01/etc
mkdir -p $FOLDER/01/opt

title 4 "Copy script"
echo $PWD
echo $0
echo dirbase $0

