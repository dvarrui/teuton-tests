
group "Master OpenSUSE external configurations" do
  target "Ping to #{gett(:master_ip)} is ok."
  goto :localhost, :exec => "ping #{get(:master_ip)} -c 2"
  expect '64 bytes from'

  target "SSH port open on #{gett(:master_ip)}"
  goto :localhost, :exec => "nmap -Pn #{get(:master_ip)}"
  expect_one [ "ssh", "open" ]
end

group "Master OpenSUSE student configurations" do
  target "Set hostname to #{get(:master_hostname)}."
  goto :master, :exec => "hostname -a"
  expect_one get(:master_hostname)

  target "Set domain to #{gett(:domain)}."
  goto :master, :exec => "hostname -d"
  expect_one get(:domain)

  fqdn = get(:master_hostname) + "." + get(:domain)
  target "Ensure FQDN is #{fqdn}."
  goto :master, :exec => "hostname -f"
  expect_one fqdn

  target "Create user #{get(:username)}."
  goto :master, :exec => "cat /etc/passwd"
  expect_one get(:username)

  target "Set password to #{get(:username)} user."
  goto :master, :exec => "cat /etc/shadow | grep '#{get(:username)}:' | cut -d : -f 2| wc -l"
  expect result.eq(1)

  target "Open session with user #{get(:username)}."
  goto :master, :exec => "last"
  expect get(:username)[0,8]

  goto :master, :exec => "blkid |grep sda1"
  unique "master_sda1_UUID", result.value
  goto :master, :exec => "blkid |grep sda2"
  unique "master_sda2_UUID", result.value
end

task "Master OpenSUSE network configurations" do
  goto :master, :exec => "ip a|grep ether"
  mac= result.value
  log    ("master_MAC = #{mac}")
  unique "MAC", mac

  target "Gateway <#{get(:gateway_ip)}>"
  goto   :master, :exec => "route -n"
  expect result.find!("UG").find!(get(:gateway_ip)).count!.eq 1

  target "WWW routing OK"
  goto   :master, :exec => "ping 88.198.18.148 -c 1"
  expect result.find!(" 0% packet loss,").count!.eq 1

  target "DNS OK"
  goto   :master, :exec => "nslookup www.iespuertodelacruz.es"
  expect result.find!("Address:").find!("88.198.18.148").count!.eq 1
end
