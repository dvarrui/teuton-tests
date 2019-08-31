
=begin
 State       : UNDER DEVELOPMENT
 Course name : IDP1516
 Activity    : Backup (Trimestre2)
 MV OS       : host1 => Window7
               host2 => Windows2008server
               hots3 => OpenSUSE 132
 Spanish URL : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/idp/backup/README.md
=end

require_relative 'windows-config'
require_relative 'opensuse-config'
require_relative 'opensuse-backup'

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
  :host2_ip: 172.19.2.21
  :host3_ip: 172.19.2.51
  :host1_password: 45454545a
  :firstname: david
  :lastname1: vargas
  :lastname2: ruiz
=end
