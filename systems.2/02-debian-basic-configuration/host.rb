
group 'Debian HOSTNAME configuration' do

  set(:host1_hostname, "#{get(:lastname1)}d.#{get(:domain)}")

  target "Checking hostname #{gett(:host1_hostname)}"
  run "hostname -f", on: :host1
  expect get(:host1_hostname)

  unique "hostname", result.value
  run "hostname -f", on: :host1
  unique "UUID", result.value

end

group 'Network configuration' do

  target "Ensure Gateway configuration is working"
  run "ping 8.8.4.4 -c 1", on: :host1
  expect_one "64 bytes from 8.8.4.4"

  target "Ensure network DNS configuration is working"
  run "host www.nba.com", on: :host1
  expect "has address"
end
