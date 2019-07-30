# encoding: utf-8

=begin
 Course name : IDP1516
 Activity    : Commands 01
 MV OS       : GNU/Linux Debian 7
=end

require_relative 'host'
require_relative 'user'
require_relative 'mkdir'

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
  :host1_ip: 172.19.2.30
  :host1_password: 45454545a
  :firstname: david
  :lastname1: vargas
  :lastname2: ruiz

=end
