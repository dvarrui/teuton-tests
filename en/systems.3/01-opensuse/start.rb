
use 'general'
use 'user'
use 'network'
use 'hostname'

play do
	show
	export :format => :txt
	send :copy_to => :host1
end

=begin
---
:global:
  :ip_prefix: '172.19.'
  :ip_sufix: '.31'
  :host1_username: root
  :dominio: curso1819
:cases:
- :tt_members: MEMBERS
  :number: '99'
  :host1_password: secret
  :firstname: value
  :lastname1: value
  :lastname2: value
=end
