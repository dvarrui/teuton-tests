
=begin
 State       : In progress...
 Course name : ADD1516
 Activity    : Remote access using VNC
 MV OS       : GNU/Linux OpenSUSE, Windows7 and Windows2012server
 Spanish URL : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/add/vnc/README.md

TODO:
* netstat -ntap
* nmap -Pn
* zypper se
=end

use 'debian-configuration'
use 'opensuse-configuration'
use 'debian-vnc-server'

play do
	show
	export
end

=begin
---
:global:
  :host1_username: sysadmingame
  :host1_protocol: telnet
  :host2_username: sysadmingame
  :host2_protocol: telnet
  :host3_username: root
  :domain: 'curso1617'
:cases:
- :tt_members: MEMBERS
  :number: '99'
  :firstname: VALUE
  :lastname1: VALUE
  :lastname2: VALUE
  :host1_password: secret
=end
