
group "Windows configurations" do
  target "ping #{get(:win_ip)} OK"
  goto :localhost, :exec => "ping #{get(:win_ip)} -c 1"
  expect_none 'Destination Host Unreachable'

  target "Netbios-ssn service on #{gett(:win_ip)}"
  goto :localhost, :exec => "nmap -Pn #{get(:win_ip)}"
  expect_one ['139/tcp', 'open']
end
