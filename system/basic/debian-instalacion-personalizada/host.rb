
group 'HOST configurations' do

  target "Checking SSH port <#{get(:host1_ip)}>"
  run "nmap -Pn #{get(:host1_ip)}"
  expect_one [ 'ssh', 'open' ]

  hostname = "#{get(:lastname)}#{get(:number)}.#{get(:domain)}"
  set(:host1_hostname, hostname)

  target "Checking hostname <#{get(:host1_hostname)}>"
  goto  :host1, :exec => "hostname -f"
  expect result.equal?(get(:host1_hostname))

  unique "hostname", result.value
end

group 'Network configuration' do

  target "gateway configuration"
  goto  :host1, :exec => "ping 8.8.4.4 -c 1"
  expect result.find("64 bytes from 8.8.4.4").count.eq(1)

  target "DNS configuration"
  goto  :host1, :exec => "host www.nba.com"
  expect result.find("has address").count.gt(0)
end
