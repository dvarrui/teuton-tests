
group "OpenSUSE external configurations" do
  set :opensuse_ip, "#{get(:ip_prefix)}#{get(:number).to_i}#{get(:ip_sufix)}"

  target "ping #{gett(:opensuse_ip)} OK"
  goto :localhost, :exec => "ping #{get(:opensuse_ip)} -c 2"
  expect '64 bytes from'

  target "SSH port 22 open on #{gett(:opensuse_ip)}"
  goto :localhost, :exec => "nmap #{get(:opensuse_ip)} -Pn"
  expect_one ['ssh', 'open']
end

group "OpenSUSE student personal configurations" do
  pcname = "#{get(:lastname1)}#{get(:number)}g1"
  target "Checking hostname -a equal to #{pcname}."
  goto :opensuse, :exec => "hostname -a"
  expect result.equal?(pcname)

  target "Hostname -d equal #{get(:domain)}"
  goto :opensuse, :exec => "hostname -d"
  expect result.equal?(get(:domain))

  fullname= pcname+"."+get(:domain)
  target "Hostname -f equal to <"+fullname+">"
  goto :opensuse, :exec => "hostname -f"
  expect result.equal?(fullname)

  username=get(:firstname)

  target "User <#{username}> exists"
  goto :opensuse, :exec => "cat /etc/passwd"
  expect_one username

  target "User <#{username}> with not empty password "
  goto :opensuse, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l"
  expect result.eq(1)

  target "User <#{username}> logged"
  goto :opensuse, :exec => 'last'
  expect username[0,8]

  goto :opensuse, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto :opensuse, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value
end

group "OpenSUSE network configurations" do
  goto :opensuse, :exec => "ip a|grep ether"
  mac = result.value
  log    ("opensuse_MAC = #{mac}")
  unique "MAC", mac

  target "Gateway configured with #{gett(:gateway_ip)}."
  goto   :opensuse, :exec => "route -n"
  expect_one [ 'UG', get(:gateway_ip) ]

  target "WWW routing working."
  goto   :opensuse, :exec => "ping 8.8.4.4 -c 1"
  expect_one ' 0% packet loss,'

  target "DNS configuration working."
  goto   :opensuse, :exec => "nslookup www.iespuertodelacruz.es"
  expect_one [ 'Address:', '88.198.18.148' ]
end
