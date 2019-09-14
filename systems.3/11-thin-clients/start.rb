#!/usr/bin/ruby
# encoding: utf-8

=begin
 State       : In progress...
 Activity    : Thin Clients LTSP
 MV OS       : GNU/Linux OpenSUSE 13.2
 Spanish URL : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/add/clientes-ligeros/README.md
=end

use 'configuration'
use 'users'
use 'server'
use 'clients'

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
  :host1_ip: 172.18.1.41
  :host1_password: password1
  :apellido1: vargas
  :apellido2: ruiz
...
=end
