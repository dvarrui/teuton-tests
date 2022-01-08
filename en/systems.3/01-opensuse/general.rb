
group 'General' do
  set(:host1_ip, get(:ip_prefix)+get(:number).to_i.to_s+get(:ip_sufix))

  target "Open SSH port on #{get(:host1_ip)}"
  run "nmap -Pn #{get(:host1_ip)}"
  expect_one [ 'ssh', 'open' ]

  goto  :host1, :exec => "hostname"
  unique "hostname", result.value
  goto  :host1, :exec => "blkid |grep sda1"
  unique "UUID", result.value
end
