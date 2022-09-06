
group 'Host configurations' do

  target "Ensure SSH port is open on #{gett(:host1_ip)}"
  run "nmap -Pn #{get(:host1_ip)}"
  expect_one [ 'ssh', 'open' ]

  hostname = "#{get(:lastname)}#{get(:number)}d1.#{get(:domain)}"
  set(:host1_hostname, hostname)

  target "Update hostname with #{gett(:host1_hostname)}"
  run "hostname -f", on: :host1
  expect get(:host1_hostname)

  unique "hostname", result.value
end
