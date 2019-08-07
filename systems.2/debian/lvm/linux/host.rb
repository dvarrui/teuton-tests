
group "External connectivity" do

  target "Host #{gett(:linux1_ip)} responds to ping command"
  run "ping #{get(:linux1_ip)} -c 1"
  expect_none "Destination Host Unreachable"

  target "Access SSH (port 22) opened on #{gett(:linux1_ip)}"
  run "nmap #{get(:linux1_ip)} -Pn"
  expect_one [ "ssh","open" ]

end

group "Host configuration" do

  set(:linux1_hostname, "#{get(:lastname1)}#{get(:number)}d1")
  target "Checking hostname -a #{gett(:linux1_hostname)}"
  goto :linux1, :exec => "hostname -a"
  expect get(:linux1_hostname)

  target "Checking hostname -d #{gett(:linux1_domain)}"
  goto :linux1, :exec => "hostname -d"
  expect get(:linux1_domain)

  set(:linux1_fqdn, (get(:linux1_hostname)+"."+get(:linux1_domain)))
  target "Checking hostname -f #{gett(:linux1_fqdn)}"
  goto :linux1, :exec => "hostname -f"
  expect result.equal?(get(:linux1_fqdn))

  goto :linux1, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto :linux1, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value

end

group "User configuration" do

  username = get(:firstname)

  target "User <#{username}> exists"
  goto :linux1, :exec => "id '#{username}'"
  expect_one username
end
