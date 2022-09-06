
group "Configure W7 and W2008server" do
  target "ping #{gett(:win7_ip)}"
  run "ping #{get(:win7_ip)} -c 1|"
  expect_none 'Destination Host Unreachable'

  target "ping #{gett(:ws2008_ip)}"
  run "ping #{get(:ws2008_ip)} -c 1"
  expect_none 'Destination Host Unreachable'

  target "Netbios-SSN service on #{gett(:ws2008_ip)}"
  run "nmap -Pn #{get(:ws2008_ip)}"
  expect_one ['139/tcp', 'open']

  target "Microsoft-DS service on #{gett(:ws2008_ip)}"
  result.restore!
  expect_one ['445/tcp', 'open']
end
