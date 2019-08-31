
use 'opensuse'
use 'linux'
use 'disk_and_partitions'

start do
	show
	export :format => :colored_text
  send :copy_to => :host1
end

=begin
---
:global:
  :opensuse1_username: root
  :dominio: curso1819
:cases:
- :tt_members: VALUE
  :number: '99'
  :opensuse1_ip: 172.18.7.31
  :opensuse1_password: 'secret'
  :firstname: VALUE
  :lastname1: VALUE
  :lastname2: VALUE
=end
