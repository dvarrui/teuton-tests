
group :hostname_configurations do
  target "Checking SSH port <#{get(:host1_ip)}>"
  goto  :localhost, :exec => "nmap #{get(:host1_ip)}"
  expect result.find("ssh").count.eq(1)

  _hostname="#{get(:lastname1)}.#{get(:lastname2)}"
  target "Checking hostname <#{_hostname}>"
  goto  :host1, :exec => "hostname -f"
  expect result.equal?(_hostname)

  unique "hostname", result.value
  goto  :host1, :exec => "blkid | grep sda1"
  unique "UUID", result.value
end
