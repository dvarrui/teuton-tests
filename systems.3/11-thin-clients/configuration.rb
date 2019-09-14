
group "Configure hostname" do
  set( :host1_ip , "#{get(:ip_prefix)}#{get(:number).to_i}#{get(:ip_sufix)}")

  target "Ensure SSH port open on #{gett(:host1_ip)}"
  goto :localhost, :exec => "nmap #{get(:host1_ip)}"
  expect_one [ "ssh", "open" ]

  set :host1_hostname, "#{get(:lastname1)}#{get(:number)}u1.#{get(:domain)}"
  target "Set hostname to #{get(:host1_hostname)}."
  goto :host1, :exec => "hostname -f"
  expect result.equal(get(:host1_hostname))

  unique "hostname", result.value
  goto :host1, :exec => "blkid |grep sda1"
  unique "UUID", result.value
end
