group "Configurar las interfaces de red" do
  readme "NOTA:"
  readme "- GNS3 debe estar iniciado con el proyecto abierto"
  readme "- Los dispositivos deben estar iniciados"

  target "Configurar pc1 ip <#{get(:pc1_ip)}>"
  set(:gns3server_port, get(:pc1_console))
  run "show ip", on: :gns3server
  expect get(:pc1_ip)
 
  target "Configurar pc2 ip <#{get(:pc2_ip)}>"
  set(:gns3server_port, get(:pc2_console))
  run "show ip", on: :gns3server
  expect get(:pc2_ip)

end

group "Comprobar la conectividad entre los dispositivos" do
  readme "NOTA:"
  readme "- GNS3 debe estar iniciado con el proyecto abierto"
  readme "- Los dispositivos deben estar iniciados"

  target "ping pc1 -> pc2"
  set(:gns3server_port, get(:pc1_console))
  run "ping #{get(:pc2_ip)} -c 4", on: :gns3server
  expect "bytes from"

  target "ping pc2 -> pc1"
  set(:gns3server_port, get(:pc2_console))
  run "ping #{get(:pc1_ip)} -c 4", on: :gns3server
  expect "bytes from"

end
