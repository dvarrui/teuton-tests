
group "External configurations" do

  target "ping to <#{get(:host1_ip)}>"
  goto :localhost, :exec => "ping #{get(:host1_ip)} -c 1"
  expect_none "100% packet loss"

  target "SSH port 22 on <#{get(:host1_ip)}> open"
  goto :localhost, :exec => "nmap #{get(:host1_ip)} -Pn"
  expect ["ssh", "open"]
end

group "OpenSUSE student configurations" do
  target "Checking hostname <#{get(:host1_hostname)}>"
  goto :host1, :exec => "hostname"
  expect get(:host1_hostname)

  target "User <#{get(:username)}> exists"
  goto :host1, :exec => "cat /etc/passwd"
  expect_one get(:username)
end

task "Network configurations" do
  goto :host1, :exec => "ip a|grep ether"
  mac= result.value
  log    ("host2_MAC = #{mac}")
  unique "MAC", mac

  target "WWW routing OK"
  goto   :host1, :exec => "ping 8.8.4.4 -c 1"
  expect_one " 0% packet loss,"

  target "DNS OK"
  goto   :host1, :exec => "nslookup www.iespuertodelacruz.es"
  expect_one [ "Address:", "88.198.18.148" ]
end
