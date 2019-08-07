
group "Network configuration" do

  target "Host A with IP/mask <#{get(:hostA_ip)}/24>"
  goto :hostA, :exec => "ip a"
  expect [ "inet", "#{get(:hostA_ip)}/24" ]

  target "Host B with IP/mask <#{get(:hostB_ip)}/24>"
  goto :hostB, :exec => "ip a"
  expect [ "inet", "#{get(:hostB_ip)}/24" ]

end
