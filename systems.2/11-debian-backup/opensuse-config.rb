
group "Configure OpenSUSE 13.2" do
  target "SSH port 22 on #{gett(:opensuse_ip)} open"
  goto   :localhost, :exec => "nmap #{get(:opensuse_ip)} -Pn"
  expect_one [ 'ssh', 'open']

  hostname3a = "#{get(:lastname1)}#{get(:number)}g1"
  target "Checking hostname -a is " + hostname3a
  goto   :opensuse, :exec => "hostname -a"
  expect result.eq hostname3a

  hostname3b="#{get(:domain)}"
  target "Checking hostname -d is "+hostname3b
  goto   :opensuse, :exec => "hostname -d"
  expect result.eq hostname3b

  hostname3c="#{hostname3a}.#{hostname3b}"
  target "Checking hostname -f is " + hostname3c
  goto   :opensuse, :exec => "hostname -f"
  expect result.eq hostname3c

  goto   :opensuse, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto   :opensuse, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value
end

group "Configure users" do
  username = get(:firstname)

  target "User #{username} exists"
  goto   :opensuse, :exec => "id #{username}"
  expect_one username

  target "User #{username} with not empty password "
  goto   :opensuse, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l"
  expect result.equal(1)

  target "User #{username} logged"
  goto   :opensuse, :exec => "last"
  expect username[0,8]
end
