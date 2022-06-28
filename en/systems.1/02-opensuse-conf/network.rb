
group "OpenSUSE network configurations" do
  run "ip a|grep ether", on: :opensuse
  mac = result.value
  log    ("opensuse_MAC = #{mac}")
  unique "MAC", mac

  target "Gateway configured with #{gett(:gateway_ip)}."
  run "route -n", on: :opensuse
  expect_one [ 'UG', get(:gateway_ip) ]

  target "WWW routing working."
  run "ping 8.8.4.4 -c 1", on: :opensuse
  expect_one ' 0% packet loss,'

  target "DNS configuration working."
  run "nslookup www.iespuertodelacruz.es", on: :opensue
  expect_one [ 'Address:', '88.198.18.148' ]
end
