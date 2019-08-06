
group "Debian HOST configurations" do
  hostname="#{get(:lastname1)}#{get(:number)}d1.#{get(:dominio)}"
  set(:host1_hostname, hostname)

  target "Ensure hostname is #{gett(:host1_hostname)}"
  goto  :host1, :exec => "hostname -f"
  expect get(:host1_hostname)

  unique "hostname", result.value

  goto  :host1, :exec => "blkid"
  unique "UUID", result.value
end

group 'Network configuration' do
  target "Ensure Gateway network configuration is working"
  goto  :host1, :exec => "ping 8.8.4.4 -c 1"
  expect "64 bytes from 8.8.4.4"

  target "Ensure DNS network configuration is working"
  goto  :linux1, :exec => "host www.nba.com"
  expect "has address"
end
