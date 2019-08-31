=begin
  Course name : IDP1516
     Activity : RSyslog Debian (Trimestre2)
        MV OS : host1 => Debian8
              : host2 => Windows7
   Teacher OS : GNU/Linux
  English URL : (Under construction. Sorry!)
  Spanish URL : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/idp/monitorizar/eventos-locales-windows-debian.md
=end

use 'configurations'
use 'webmin'
use 'rsyslog'

start do
  show
  export :colored_text
  send :copy_to => :host1
end

=begin
#Example of configuration file:
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
