
group :hostname_configurations do

  target "Checking SSH port <#{get(:host1_ip)}>"
  run "nmap #{get(:host1_ip)}"
  expect_one "ssh"

  _hostname="#{get(:lastname1)}.#{get(:domain)}"
  target "Checking hostname <#{_hostname}>"
  run "hostname -f", on: :host1
  expect result.equal?(_hostname)

  unique "hostname", result.value
  run "blkid | grep sda1", on: :host1
  unique "UUID", result.value
end
