
group "Host/IP associations" do
	target "Define host/IP association for #{get(:client1_hostname)}"
  goto   :server1, :exec => "cat /etc/hosts"
  expect_one [ get(:client1_hostname), get(:client1_ip) ]

  target "Define host/IP association for #{get(:client2_hostname)}"
  result.restore!
  expect_one [ get(:client2_hostname), get(:client2_ip) ]
end

group "Defining more users" do
  (1..4).each do |i|
    username = get(:lastname1) + i.to_s
    target "Create user #{username} into SSH Server"
    goto :server1, :exec => "id #{username}"
    expect_one username
  end
end

group "SSH access without passwords" do
  goto   :client1, :exec => "cat /home/#{get(:username)}/.ssh/id_rsa.pub"
  client_idrsapub = result.value

  target "Authorize user #{get(:username)}@ssh-client1 to access user #{get(:lastname1)}4@ssh-server"
  goto   :server1, :exec => "vdir /home/#{get(:lastname1)}4/.ssh/authorized_keys"
  expect result.equal(client_idrsapub)
end

group "Configuring remoteapp" do
  target "Create group #{gett(:groupname)}"
  goto :server1, :exec => "cat /etc/group"
  expect_one get(:groupname)
end
