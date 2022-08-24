
group "OpenSUSE external configurations" do
  set :opensuse_ip, "#{get(:ip_prefix)}#{get(:number).to_i}#{get(:ip_sufix)}"

  target "ping #{gett(:opensuse_ip)} OK"
  run "ping #{get(:opensuse_ip)} -c 2"
  expect '64 bytes from'

  target "SSH port 22 open on #{gett(:opensuse_ip)}"
  run "nmap #{get(:opensuse_ip)} -Pn"
  expect_one ['ssh', 'open']
end

group "OpenSUSE student personal configurations" do
  pcname = "#{get(:lastname1)}#{get(:number)}g1"
  target "Checking hostname -a equal to #{pcname}."
  run "hostname -a", on: :opensuse
  expect result.equal?(pcname)

  target "Hostname -d equal #{get(:domain)}"
  run "hostname -d", on: :opensuse
  expect result.equal?(get(:domain))

  fullname= pcname+"."+get(:domain)
  target "Hostname -f equal to <"+fullname+">"
  run "hostname -f", on: :opensuse
  expect result.equal?(fullname)

  username=get(:firstname)

  target "User <#{username}> exists"
  run "cat /etc/passwd", on: :opensuse
  expect_one username

  target "User <#{username}> with not empty password "
  run "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l", on: :opensuse
  expect result.eq(1)

  target "User <#{username}> logged"
  run 'last', on: :opensuse
  expect username[0,8]

  run "blkid |grep sda1", on: :opensuse
  unique "UUID_sda1", result.value
  run "blkid |grep sda2", on: :opensuse
  unique "UUID_sda2", result.value
end

