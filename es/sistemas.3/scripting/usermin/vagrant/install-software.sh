#!/usr/bin/env bash

DISTRO=USERMINE
AUTHOR=teuton-software
URL=https://github.com/teuton-software/teuton-tests

apt update
apt install -y vim nano
apt install -y tree nmap
apt install -y git
apt install -y ruby 

apt install -y figlet
figlet $DISTRO > /etc/motd
echo "" >> /etc/motd
echo $AUTHOR >> /etc/motd
echo $URL >> /etc/motd

echo "# Adding more alias" >> /home/vagrant/.bashrc
echo "alias c='clear'" >> /home/vagrant/.bashrc
echo "alias v='vdir'" >> /home/vagrant/.bashrc

lsb_release -d
