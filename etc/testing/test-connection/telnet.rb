#!/usr/bin/env ruby

require 'net/telnet'

host = [
         { ip: '172.18.2.11', username: 'teuton', password: ''},
         { ip: '172.19.15.12', username: 'teuton', password: ''}
       ]
timeout = 30
command = 'net user'
i = 1

puts "[INFO] Testing telnet to..."
puts "       #{host[i]}"

text = ''
h = Net::Telnet.new( 'Host' => host[i][:ip],
                     'Timeout' => timeout,
                     'Prompt' => /login|teuton|[$%#>]/ )
#                     'Prompt' => 'login:')
#                     'Prompt' => /[$%#>] \z/n)
#                     'Prompt' => 'teuton')
h.login(host[i][:username], host[i][:password])

puts "[INFO] Running...#{command}"
h.cmd(command) { |i| text << i }

puts "[INFO] Output is ..."
lines = text.split("\n")
lines.each_with_index do |line, index|
  puts format('%2d: %s', index, line)
end
h.close
