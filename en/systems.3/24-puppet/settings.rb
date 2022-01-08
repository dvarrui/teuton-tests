
group "Settings" do
  set :master_ip, get(:ip_prefix) + get(:number).to_i.to_s + ".100"
  set(:master_hostname, "master#{get(:number).to_s}g")

  set :client1_ip, get(:ip_prefix) + get(:number).to_i.to_s + ".101"
  set(:client1_hostname, "client#{get(:number).to_s}g1")

  set :client2_ip, get(:ip_prefix) + get(:number).to_i.to_s + ".102"
  set(:client2_hostname, "client#{get(:number).to_s}w1")
end
