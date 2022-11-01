#!/usr/bin/env bash

DISTRO=USERMIN

apt update
apt install -y vim nano
apt install -y tree nmap
apt install -y git
apt install -y ruby
gem install teuton

apt install -y figlet
figlet $DISTRO > /etc/motd
echo "" >> /etc/motd
echo "Teuton Software" >> /etc/motd
echo "https://github.com/teuton-software" >> /etc/motd

echo "# Adding more alias" >> /home/vagrant/.bashrc
echo "alias c='clear'" >> /home/vagrant/.bashrc
echo "alias v='vdir'" >> /home/vagrant/.bashrc

lsb_release -d
