
group "Debian configuration: host1" do
  target "ping #{get(:host1_ip)} (debian) OK"
  goto :localhost, :exec => "ping #{get(:host1_ip)} -c 1"
  expect_none 'Destination Host Unreachable'

  target "SSH port 22 on #{gett(:host1_ip)} open"
  goto :localhost, :exec => "nmap #{get(:host1_ip)} -Pn "
  expect_one ['ssh', 'open']

  hostname_a = "#{get(:lastname1)}#{get(:number)}d1"
  target "Checking hostname -a equal #{hostname_a}."
  goto :host1, :exec => "hostname -a"
  expect result.equal?(hostname_a)

  target "Checking hostname -d equal #{get(:domain)}."
  goto :host1, :exec => "hostname -d"
  expect result.equal?(get(:domain))

  hostname_f = "#{hostname_a}.#{get(:domain)}"
  target "Checking hostname -f equal #{hostname_f}."
  goto :host1, :exec => "hostname -f"
  expect result.equal?(hostname_f)

  goto :host1, :exec => "blkid |grep sda1"
  unique "host1_UUID_sda1", result.value
  goto :host1, :exec => "blkid |grep sda2"
  unique "host1_UUID_sda2", result.value

  username=get(:firstname)

  target "User <#{username}> exists"
  goto :host1, :exec => "id #{username}"
  expect_one username

  target "User #{username} with not empty password "
  goto :host1, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l"
  expect result.equal?(1)

  target "User <#{username}> had logged"
  goto :host1, :exec => "last"
  expect username[0,8]
end

group "Configurations host2" do
  target "ping #{get(:host2_ip)} (ws2012) OK"
  goto :localhost, :exec => "ping #{get(:host2_ip)} -c 1"
  expect_none 'Destination Host Unreachable'

  target "netbios-ssn service working on #{gett(:host2_ip)}"
  goto :localhost, :exec => "nmap -Pn #{get(:host2_ip)}"
  expect_one ['139/tcp', 'open']
end
