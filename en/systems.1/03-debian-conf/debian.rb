
group "Debian external configurations" do
  set :debian_ip, "#{get(:ip_prefix)}#{get(:number).to_i}#{get(:ip_sufix)}"

  target "ping to #{gett(:debian_ip)} ok"
  goto :localhost, :exec => "ping #{get(:debian_ip)} -c 1"
  expect_none '100% packet loss'

  target "SSH port 22 open on #{gett(:debian_ip)}"
  goto :localhost, :exec => "nmap #{get(:debian_ip)} -Pn"
  expect_one [ 'ssh', 'open' ]
end

group "Debian student personal configurations" do
  pcname = "#{get(:lastname1)}#{get(:number)}d1"
  target "Set hostname -a equal #{pcname}"
  goto :debian, :exec => "hostname -a"
  expect result.equal?(pcname)

  target "Set hostname -d equal #{gett(:domain)}."
  goto :debian, :exec => "hostname -d"
  expect result.equal?(get(:domain))

  fullname= pcname + "." + get(:domain)
  target "Set hostname -f equal #{fullname}."
  goto :debian, :exec => "hostname -f"
  expect result.equal?(fullname)

  username = get(:firstname)

  target "User <#{username}> exists"
  goto :debian, :exec => "cat /etc/passwd"
  expect_one username

  target "User <#{username}> with not empty password "
  goto :debian, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l"
  expect result.eq(1)

  target "User <#{username}> logged"
  goto :debian, :exec => "last"
  expect username[0,8]

  goto :debian, :exec => "blkid |grep sda1"
  unique "debian_UUID_sda1", result.value
  goto :debian, :exec => "blkid |grep sda2"
  unique "debian_UUID_sda2", result.value
end

group "Debian network configurations" do
  goto :debian, :exec => "ip a|grep ether"
  mac = result.value
  log    ("debian_MAC = #{mac}")
  unique "MAC", mac

  target "Gateway IP #{gett(:gateway_ip)}"
  goto   :debian, :exec => "route -n"
  expect_one [ 'UG', get(:gateway_ip) ]

  target "WWW routing working"
  goto   :debian, :exec => "ping 88.198.18.148 -c 1"
  expect_one ' 0% packet loss,'

  target "DNS configuration working"
  goto   :debian, :exec => "nslookup www.iespuertodelacruz.es"
  expect_one [ 'Address:', '88.198.18.148' ]
end
