# encoding: utf-8


group "win1 config" do
=begin
  target "ping #{get(:host2_ip)} to #{get(:host2_osname)}"
  goto :localhost, :exec => "ping #{get(:host2_ip)} -c 1| grep 'Destination Host Unreachable'|wc -l"
  expect result.equal?(0)

  target "netbios-ssn service on #{get(:host2_ip)}"
  goto :localhost, :exec => "nmap -Pn #{get(:host2_ip)} | grep '139/tcp'| grep 'open'|wc -l"
  expect result.equal?(1)
=end
end
