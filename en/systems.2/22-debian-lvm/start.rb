# encoding: utf-8

use 'linux/host'
#use 'win/configuration'
use 'linux/partitions'
use 'volumes/settings'
use 'volumes/group-vgXXdebian'
use 'volumes/logical'
use 'volumes/group-vgXXextra'

play do
  show
  export :format => :colored_text
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
