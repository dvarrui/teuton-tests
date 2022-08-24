
group "Windows Server network configurations" do
  run "ipconfig /all", on: :winserver
  mac = result.find!("Direcci").content[0]
  log    ("winserver_MAC = #{mac}")
  unique "MAC", mac
  # getmac command => MAC number

  target "Gateway IP is #{gett(:gateway_ip)}."
  run 'ipconfig', on: :winserver
  expect_one [ 'enlace', get(:gateway_ip) ]

  target "WWW routing working"
  run 'ping 8.8.4.4', on: :winserver
  expect "Respuesta"

  target "DNS working"
  run "nslookup www.iespuertodelacruz.es", on: :winserver
  expect_one [ "Address:", "88.198.18.148" ]
end

