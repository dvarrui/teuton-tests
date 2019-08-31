
group "External connectivity" do
  target "Host #{gett(:linux_ip)} responds to ping command"
  run "ping #{get(:linux_ip)} -c 1"
  expect_none "Destination Host Unreachable"

  target "Access SSH (port 22) opened on #{gett(:linux_ip)}"
  run "nmap #{get(:linux_ip)} -Pn"
  expect_one [ "ssh","open" ]
end

group "Host configuration" do
  set(:linux_hostname, "#{get(:lastname1)}#{get(:number)}d1")
  log "Setting linux_hostname = #{get(:linux_hostname)}"

  target "Checking hostname -a #{gett(:linux_hostname)}"
  goto :linux, :exec => "hostname -a"
  expect get(:linux_hostname)

  target "Checking hostname -d #{gett(:linux_domain)}"
  goto :linux, :exec => "hostname -d"
  expect get(:linux_domain)

  set(:linux_fqdn, (get(:linux_hostname)+"."+get(:linux_domain)))
  log "Setting linux1_fqdn = #{get(:linux_fqdn)}"

  target "Checking hostname -f #{gett(:linux_fqdn)}"
  goto :linux, :exec => "hostname -f"
  expect get(:linux_fqdn)

  goto :linux, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto :linux, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value
end

group "User configuration" do
  target "Create user #{gett(:firstname)}"
  goto :linux, :exec => "id #{get(:firstname)}"
  expect_one get(:firstname)
end
