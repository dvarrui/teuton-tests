
group "OpenSUSE: external configurations" do

  target "Ping to #{gett(:linux1_ip)} working"
  goto :localhost, :exec => "ping #{get(:linux1_ip)} -c 1"
  expect_none '100% packet loss'

  target "Open SSH port 22 on #{gett(:linux1_ip)}"
  goto :localhost, :exec => "nmap #{get(:linux1_ip)} -Pn"
  expect_one [ 'ssh', 'open' ]
end

group "OpenSUSE: student configurations" do
  shortname = "ssh-server#{get(:number)}"
  target "Set hostname to #{shortname}"
  goto :linux1, :exec => "hostname -a"
  expect result.equal?(shortname)

  target "Set domain to #{get(:domain)}"
  goto :linux1, :exec => "hostname -d"
  expect result.equal?(get(:domain))

  fullname = shortname+"."+get(:domain)
  target "Ensure host fullname equal to #{fullname}"
  goto :linux1, :exec => "hostname -f"
  expect result.equal?(fullname)

  target "Create user #{gett(:username)}"
  goto :linux1, :exec => "cat /etc/passwd"
  expect_one "#{get(:username)}:"

  target "Set password to user #{get(:username)}"
  goto :linux1, :exec => "cat /etc/shadow | grep '#{get(:username)}:' | cut -d : -f 2| wc -l"
  expect result.eq(1)

  target "Open session with user #{get(:username)}"
  goto :linux1, :exec => "last"
  expect get(:username)[0,8]

  goto :linux1, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto :linux1, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value
end

group "OpenSUSE: network configurations" do
  goto :linux1, :exec => "ip a|grep ether"
  mac = result.value
  log    ("host2_MAC = #{mac}")
  unique "MAC", mac

  target "Set Gateway to #{gett(:gateway_ip)}"
  goto   :linux1, :exec => "route -n"
  expect_one [ "UG", get(:gateway_ip) ]

  target "WWW routing working"
  goto   :linux1, :exec => "ping 88.198.18.148 -c 1"
  expect_one " 0% packet loss,"

  target "DNS OK working"
  goto   :linux1, :exec => "nslookup www.iespuertodelacruz.es"
  expect_one [ "Address:", "88.198.18.148" ]
end
