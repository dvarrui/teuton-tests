# encoding: utf-8

group "linux1 configuration" do

  target "ping #{get(:linux1_ip)} to #{get(:linux1_osname)}"
  run "ping #{get(:linux1_ip)} -c 1"
  expect result.find("Destination Host Unreachable").count.equal(0)

  target "SSH port 22 on <"+get(:linux1_ip)+"> open"
  run "nmap #{get(:linux1_ip)} -Pn"
  expect result.find("ssh").count.equal?(1)

  set(:linux1_hostname, "#{get(:lastname1)}#{get(:number)}d1")
  target "Checking hostname -a <"+get(:linux1_hostname)+">"
  goto :linux1, :exec => "hostname -a"
  expect result.equal?(get(:linux_hostname))

  target "Checking hostname -d <"+get(:linux1_domain)+">"
  goto :linux1, :exec => "hostname -d"
  expect result.equal?(get(:linux1_domain))

  set(:linux1_fqdn, (get(:linux1_hostname)+"."+get(:linux1_domain)))
  target "Checking hostname -f <"+get(:linux1_fqdn)+">"
  goto :linux1, :exec => "hostname -f"
  expect result.equal?(get(:linux1_fqdn))

  goto :linux1, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto :linux1, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value

end

group "linux1: User" do
  username = get(:firstname)

  target "User <#{username}> exists"
  goto :linux1, :exec => "id '#{ username }'"
  expect result.count.equal?(1)
end
