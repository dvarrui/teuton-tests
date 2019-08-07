
group "win1: external connectivity" do

  target "ping #{get(:win1_ip)}"
  run    "ping #{get(:win1_ip)} -c 1"
  expect result.find('Destination Host Unreachable').count.equal?(0), :weight => 0.0

  target "netbios-ssn service on #{get(:win1_ip)}"
  goto :localhost, :exec => "nmap -Pn #{get(:win1_ip)} "
  expect result.find('139/tcp').find('open').count.equal?(1), , :weight => 0.0

end
