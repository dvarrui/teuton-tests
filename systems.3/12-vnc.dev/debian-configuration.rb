group "Settings" do
  set(:debian_hostname, "#{get(:lastname1)}#{get(:number)}d1")
  set(:debian_ip, "#{get(:ip_prefix)}#{get(:number)}.41")

  set(:opensuse_hostname, "#{get(:lastname1)}#{get(:number)}g1")
  set(:opensuse_ip, "#{get(:ip_prefix)}#{get(:number)}.31")
end

group "Debian configuration" do
  # Ensure unique Debian MAC
  goto   :debian, :exec => "ifconfig| grep HWaddr| tr -s ' ' '%'| cut -d % -f 5"
  unique "MAC[debian]", result.value

  target "Set Hostname to " + gett(:debian_hostname)
  goto   :debian, :exec => "hostname -a"
  expect result.equal(get(:debian_hostname))

  target "Set Domainname to " + get(:domain)
  goto   :debian, :exec =>  "hostname -d"
  expect result.equal(get(:domain))

  target "Crear user " + get(:firstname)
  goto   :debian, :exec => "cat /etc/passwd|"
  expect_one get(:firstname)

  target "Define OpenSuse(Hostname and IP) into /etc/hosts."
  goto   :debian, :exec => "cat /etc/hosts"
  expect [ get(:opensuse_hostname), get(:opensuse_ip) ]
end
