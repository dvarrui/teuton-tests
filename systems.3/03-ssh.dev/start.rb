
=begin
 State       : In progress...
 Course name : ADD1516
 Activity    : SSH conections
 MV OS       : GNU/Linux Debian 7
 Spanish URL : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/add/ssh/README.md
=end

use 'settings'
use 'opensuse-conf'
use 'ssh-server-g'
use 'ssh-client-g'

start do
	show
	export :format => :colored_text
  send   :copy_to => :host2
end

=begin
---
:global:
  :groupname: udremote
  :ip_prefix: '172.19.'
  :gateway_ip: 172.19.0.1
  :domain: curso1819
  :win1_username: sysadmingame
  :win1_protocol: ssh
  :linux1_username: root
  :linux2_username: root
:cases:
- :tt_members: MEMBERS
  :number: '99'
  :username: VALUE
  :lastname1: VALUE
  :win1_password: secret
  :linux1_password: secret
  :linux2_password: secret
=end
