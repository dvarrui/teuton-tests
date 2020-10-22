=begin
 Course name : IDP
 Activity    : Debian curtom installation
 MV OS       : GNU/Linux Debian
 Doc URL     : https://github.com/dvarrui/libro-de-actividades/tree/master/actividades/sistemas.2/instalacion/instalacion-personalizada
=end

use 'disk'
use 'host'
use 'user'

play do
	show
	export
end

=begin
---
:global:
  :host1_username: root
  :domain: curso2021
:cases:
- :tt_members: users
  :number: '01'
  :host1_ip: 1.1.1.1
  :host1_password: password
  :firstname: name
  :lastname: none
=end
