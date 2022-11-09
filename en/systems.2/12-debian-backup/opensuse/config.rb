
group "Configure OpenSUSE 13.2" do
  target "SSH port 22 on #{gett(:opensuse_ip)} open"
  run "nmap #{get(:opensuse_ip)} -Pn"
  expect_one [ 'ssh', 'open']

  hostname3a = "#{get(:lastname1)}#{get(:number)}g1"
  target "Checking hostname -a is " + hostname3a
  run "hostname -a", on: :opensuse
  expect result.eq hostname3a

  hostname3b="#{get(:domain)}"
  target "Checking hostname -d is "+hostname3b
  run "hostname -d", on: :opensuse
  expect result.eq hostname3b

  hostname3c="#{hostname3a}.#{hostname3b}"
  target "Checking hostname -f is " + hostname3c
  run "hostname -f", on: :opensuse
  expect result.eq hostname3c

  run "blkid |grep sda1", on: :opensuse
  unique "UUID_sda1", result.value
  run "blkid |grep sda2", on: :opensuse
  unique "UUID_sda2", result.value
end

group "Configure users" do
  username = get(:firstname)

  target "User #{username} exists"
  run "id #{username}", on: :opensuse
  expect_one username

  target "User #{username} with not empty password "
  run "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l", on: :opensuse
  expect result.equal(1)

  target "User #{username} logged"
  run "last", on: :opensuse
  expect username[0,8]
end
