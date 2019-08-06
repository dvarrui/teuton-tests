
group 'Debian: access to SSH service' do

  target "Ensure SSH access to #{gett(:host1_ip)} IP"
  run "nmap -Pn #{get(:host1_ip)}"
  expect_one [ 'ssh', 'open' ]

end
