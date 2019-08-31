
group "Running thin clients" do
  clients = [20, 21]

  clients.each do |i|
    ip = "192.168.0.#{i}"

	  target "Boot thin client #{ip}"
	  goto :host1, :exec => "arp"
    expect_one ip

    target "Thin client #{ip} boots from LSTP server"
	  goto :host1, :exec => "cat /var/log/syslog"
    expect [ "dhcp", "DHCPACK", ip ]

	  target "Thin client #{ip} get IP from DHCP server"
	  goto :host1, :exec => "cat /var/log/syslog"
    expect [ "dhcp", "DHCPREQUEST", ip ]
  end

  goto :host1, :exec => "ip link | grep ether"
  unique "LTSP MAC", result.value
end
