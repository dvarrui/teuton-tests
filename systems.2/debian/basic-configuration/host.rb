
group 'Debian HOSTNAME configuration' do

  set(:host1_hostname, "#{get(:lastname1)}d1.#{get(:domain)}")

  target "Checking hostname #{gett(:host1_hostname)}"
  goto  :host1, :exec => "hostname -f"
  expect get(:host1_hostname)

  unique "hostname", result.value
  goto  :host1, :exec => "hostname -f"
  unique "UUID", result.value

end

group 'Network configuration' do

  target "Ensure Gateway configuration is working"
  goto  :host1, :exec => "ping 8.8.4.4 -c 1"
  expect_one "64 bytes from 8.8.4.4"

  target "Ensure network DNS configuration is working"
  goto  :host1, :exec => "host www.nba.com"
  expect "has address"
end
