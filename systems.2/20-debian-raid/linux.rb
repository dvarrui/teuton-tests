
group "GNU/Linux configurations" do
  target "ping #{gett(:linux_ip)} OK"
  goto :localhost, :exec => "ping #{get(:linux_ip)} -c 1"
  expect_none 'Destination Host Unreachable'

  target "SSH port 22 open on #{gett(:linux_ip)}"
  goto :localhost, :exec => "nmap #{get(:linux_ip)} -Pn"
  expect_one ['ssh', 'open']

  hostname_a = "#{get(:lastname1)}#{get(:number)}g1"
  target "Checking hostname -a equal #{hostname_a}."
  goto :linux, :exec => "hostname -a"
  expect result.equal?(hostname_a)

  target "Checking hostname -d equal #{get(:domain)}."
  goto :linux, :exec => "hostname -d"
  expect result.equal?(get(:domain))

  hostname_f="#{hostname_a}.#{get(:domain)}"
  target "Checking hostname -f #{hostname_f}."
  goto :linux, :exec => "hostname -f"
  expect result.equal?(hostname_f)

  goto :linux, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto :linux, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value
end

group "GNU/Linux user definitions" do
  username = get(:firstname)

  target "User #{username} exists"
  goto :linux, :exec => "id #{username}"
  expect_one username

  target "User #{username} with not empty password"
  goto :linux, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l"
  expect result.equal?(1)

  target "User #{username} has made loggin"
  goto :linux, :exec => "last"
  expect username[0,8]
end
