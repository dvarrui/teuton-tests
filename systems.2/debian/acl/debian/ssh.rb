
group 'Access to Debian host' do

  target "Open SSH port at #{gett(:host1_ip)}"
  run "nmap -Pn #{get(:host1_ip)}"
  expect_one [ 'ssh', 'open' ]

end
