
group "Debian external configurations" do
  set :debian_ip, "#{get(:ip_prefix)}#{get(:number).to_i}#{get(:ip_sufix)}"

  target "ping to #{gett(:debian_ip)} ok"
  run "ping #{get(:debian_ip)} -c 1"
  expect_none '100% packet loss'

  target "SSH port 22 open on #{gett(:debian_ip)}"
  run "nmap #{get(:debian_ip)} -Pn"
  expect_one [ 'ssh', 'open' ]
end

group "Debian student personal configurations" do
  pcname = "#{get(:lastname1)}#{get(:number)}d1"
  target "Set hostname -a equal #{pcname}"
  run "hostname -a", on: :debian
  expect result.equal?(pcname)

  target "Set hostname -d equal #{gett(:domain)}."
  run "hostname -d", on: :debian
  expect result.equal?(get(:domain))

  fullname= pcname + "." + get(:domain)
  target "Set hostname -f equal #{fullname}."
  run "hostname -f", on: :debian
  expect result.equal?(fullname)

  username = get(:firstname)

  target "User <#{username}> exists"
  run "cat /etc/passwd", on: :debian
  expect_one username

  target "User <#{username}> with not empty password "
  run "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l", on: :debian
  expect result.eq(1)

  target "User <#{username}> logged"
  run "last", on: :debian
  expect username[0,8]

  run "blkid |grep sda1", on: :debian
  unique "debian_UUID_sda1", result.value
  run "blkid |grep sda2", on: :debian
  unique "debian_UUID_sda2", result.value
end

