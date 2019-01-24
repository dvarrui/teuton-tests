# encoding: utf-8

require_relative 'linux1-config'
#require_relative 'win1-config'
#require_relative 'linux1-lvm'

play do
  show
  export
  send :copy_to => :linux1
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
