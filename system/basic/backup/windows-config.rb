
group "Configure W7 and W2008server" do

  target "ping <"+get(:host1_ip)+"> to Windows7"
  goto   :localhost, :exec => "ping #{get(:host1_ip)} -c 1| grep 'Destination Host Unreachable'|wc -l"
  expect result.eq 0

  target "ping <"+get(:host2_ip)+"> to Windows2008server"
  goto   :localhost, :exec => "ping #{get(:host2_ip)} -c 1| grep 'Destination Host Unreachable'|wc -l"
  expect result.eq 0

  target "netbios-ssn service on <"+get(:host2_ip)+">"
  goto   :localhost, :exec => "nmap -Pn #{get(:host2_ip)} | grep '139/tcp'| grep 'open'|wc -l"
  expect result.eq 1

  target "microsoft-ds service on <"+get(:host2_ip)+">"
  goto   :localhost, :exec => "nmap -Pn #{get(:host2_ip)} | grep '445/tcp'| grep 'open'|wc -l"
  expect result.eq 1

end
