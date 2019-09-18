
group "SSH Client A: Configuration" do
  target "Create public key for #{gett(:username)}."
  goto   :client1, :exec => "vdir /home/#{get(:username)}/.ssh/"
  expect result.grep('id_rsa').count.equal(2)

  goto   :client1, :exec => "cat /etc/hosts"
	target "Define host/IP association for #{gett(:server1_hostname)}."
  result.restore!
  expect_one [ get(:server1_hostname), get(:server1_ip) ]

  target "Define host/IP association for #{gett(:client2_hostname)}."
  result.restore!
  expect_one [ get(:client2_hostname), get(:client2_ip) ]
end
