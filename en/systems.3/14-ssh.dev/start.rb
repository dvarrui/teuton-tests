
=begin
 State       : In progress...
 Course name : ADD1920
 Activity    : SSH conections
 MV OS       : Windows7, Windows 2008 Server, GNU/Linux OpenSUSE Leap 15.0
 Spanish URL : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/sistemas.3/ssh/README.md
=end

use 'settings'
use 'opensuse-conf'
use 'ssh-server1'
use 'ssh-client1'

start do
	show
	export :format => :colored_text
  send   :copy_to => :server1
end

=begin
---
---
:global:
  :ip_prefix: '172.19.'
  :gateway_ip: 172.19.0.1
  :groupname: remoteapp
  :domain: curso1819
  :server1_username: root
  :client1_username: root
  :client2_username: sysadmingame
  :client2_protocol: ssh
:cases:
- :tt_members: MEMBERS
  :number: '99'
  :username: VALUE
  :lastname1: VALUE
  :server1_password: secret
  :client1_password: secret
  :client2_password: secret
=end
