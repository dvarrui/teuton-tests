=begin
 Course name : IDP
 Activity    : Instalación personalizada de Debian
 MV OS       : GNU/Linux Debian
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
---
:global:
  :host1_username: root
  :domain: curso1819
:cases:
- :tt_members: users
  :number: '01'
  :host1_ip: 1.1.1.1
  :host1_password: password
  :firstname: name
  :lastname: none
=end
