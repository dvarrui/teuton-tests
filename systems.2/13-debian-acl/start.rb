
=begin
 URL      : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/idp/permisos/permisos-acl-debian.md
 Activity : ACL en Debian
 MV OS    : GNU/Linux Debian
 Course   : IDP
=end

use 'debian/ssh'
use 'debian/host'
use 'debian/user'

use 'disks'
use 'users_and_groups'
use 'acl'

play do
	show
	export :format => :colored_text
	send :copy_to => :host1
end

=begin
---
:global:
  :debian1_username: root
  :dominio: curso1819
:cases:
- :tt_members: members
  :number: '01'
  :debian1_ip: 172.18.1.41
  :debian1_password: password
  :firstname: firstname
  :lastname1: lastname1
  :lastname2: lastname2
=end
