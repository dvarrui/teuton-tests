# encoding: utf-8

=begin
 Course name : IDP1516
 Activity    : RAID Debian (Trimestre2)
 MV OS       : host1 => Debian8
               host2 => Windows7
=end

use 'linux'
use 'windows'
use 'raid'

start do
	show
	export
end

=begin
---
:global:
  :host1_username: root
:cases:
- :tt_members: david
  :host1_ip: 172.19.2.11
  :host1_password: 45454545a
  :host2_ip: 172.19.2.21
  :firstname: david
  :lastname1: vargas
  :lastname2: ruiz
=end
