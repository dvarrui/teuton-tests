
group "Configure W7 and W2008server" do
  target "ping #{gett(:win7_ip)}"
  goto   :localhost, :exec => "ping #{get(:win7_ip)} -c 1|"
  expect_none 'Destination Host Unreachable'

  target "ping #{gett(:ws2008_ip)}"
  goto   :localhost, :exec => "ping #{get(:ws2008_ip)} -c 1"
  expect_none 'Destination Host Unreachable'

  target "Netbios-SSN service on #{gett(:ws2008_ip)}"
  goto   :localhost, :exec => "nmap -Pn #{get(:ws2008_ip)}"
  expect_one ['139/tcp', 'open']

  target "Microsoft-DS service on #{gett(:ws2008_ip)}"
  result.restore!
  expect_one ['445/tcp', 'open']
end
