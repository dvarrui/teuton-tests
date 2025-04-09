group "Configurar las interfaces de red" do
  readme "NOTA:"
  readme "- GNS3 debe estar iniciado con el proyecto abierto"
  readme "- Los dispositivos deben estar iniciados"

  target "Configurar pc1 ip <#{get(:pc1_ip)}>"
  run "show ip", on: :vpc1
  expect_one ["IP/MASK", _pc1_ip]
 
  target "Configurar pc2 ip <#{get(:pc2_ip)}>"
  run "show ip", on: :vpc2
  expect_one ["IP/MASK", _pc2_ip]

end

group "Comprobar la conectividad entre los dispositivos" do
  readme "NOTA:"
  readme "- GNS3 debe estar iniciado con el proyecto abierto"
  readme "- Los dispositivos deben estar iniciados"

  target "ping pc1 -> pc2"
  run "ping #{get(:pc2_ip)} -c 4", on: :vpc1
  expect "bytes from"

  target "ping pc2 -> pc1"
  run "ping #{get(:pc1_ip)} -c 4", on: :vpc2
  expect "bytes from"

end
