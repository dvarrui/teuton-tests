
group "Debian network configurations" do
  run "ip a|grep ether", on: :debian
  mac = result.value
  log    ("debian_MAC = #{mac}")
  unique "MAC", mac

  target "Gateway IP #{gett(:gateway_ip)}"
  run "route -n", on: :debian
  expect_one [ 'UG', get(:gateway_ip) ]

  target "WWW routing working"
  run "ping 88.198.18.148 -c 1", on: :debian
  expect_one ' 0% packet loss,'

  target "DNS configuration working"
  run "nslookup www.iespuertodelacruz.es", on: :debian
  expect_one [ 'Address:', '88.198.18.148' ]
end
