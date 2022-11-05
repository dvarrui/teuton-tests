#!/usr/bin/env bash
APPNAME=up_environ
TESTNAME=usermin
DIRBASE=`dirname $0`
FOLDER=var/$TESTNAME/docker/profesor

title () {
  echo "==> $APPNAME: [$1] $2."
}

title 1 "Install docker"
sudo zypper install docker

title 2 "Start docker service"
sudo systemctl start docker

title 3 "Create directory tree"
mkdir -p $FOLDER/etc
mkdir -p $FOLDER/opt

title 4 "Copy script"
cp $DIRBASE/../vagrant/profesor.rb $FOLDER/opt
