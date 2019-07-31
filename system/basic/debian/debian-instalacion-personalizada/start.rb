# encoding: utf-8

=begin
 Course name : IDP
 Activity    : Instalación personalizada de Debian
 MV OS       : GNU/Linux Debian
=end

require_relative 'host'
require_relative 'user'
require_relative 'disk'

play do
	show
	export
end

=begin
---
:global:
  :host1_username: root
:cases:
- :tt_members: david
  :number: '01'
  :host1_ip: 1.1.1.1
  :host1_password: password
  :firstname: name
  :lastname: none
=end
