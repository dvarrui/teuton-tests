group "Settings" do
  set(:server1_hostname,  'ssh-server' + get(:number).to_s + 'g')
	set(:server1_ip,        get(:ip_prefix) + get(:number).to_i.to_s+".31")
  set(:client1_hostname, 'ssh-client' + get(:number).to_s + 'g')
	set(:client1_ip,       get(:ip_prefix) + get(:number).to_i.to_s+".32")
  set(:server2_hostname,  'ssh-server' + get(:number).to_s + 'w')
	set(:server2_ip,        get(:ip_prefix) + get(:number).to_i.to_s+".11")
	set(:client2_hostname, 'ssh-client' + get(:number).to_s + 'w')
	set(:client2_ip,       get(:ip_prefix) + get(:number).to_i.to_s+".12")
end
