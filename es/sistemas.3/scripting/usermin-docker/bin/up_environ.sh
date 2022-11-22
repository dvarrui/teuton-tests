#!/usr/bin/env bash
APPNAME=up_environ
TESTNAME=usermin
DIRBASE=`dirname $0`
FOLDER=var/$TESTNAME/temp/profesor

title () {
  echo "==> $APPNAME: [$1] $2."
}

CMD=`docker -v`
if [ "$?" == "0" ]; then
  title 1 "$CMD"
else
  title 1 "Install docker"
  sudo zypper install docker
fi

title 2 "Start docker service"
CMD=`systemctl status docker |grep "(running)" |wc -l`
if [ $CMD == "0" ]; then
  sudo systemctl start docker
fi

title 3 "Create directory tree"
mkdir -p $FOLDER/etc
mkdir -p $FOLDER/opt

title 4 "Copy script"
cp $DIRBASE/../vagrant/profesor.rb $FOLDER/opt
