group "Comprobar las interfaces de red" do

  target "Configurar pc1 ip #{get(:pc1_ip)}"
  console = get(:pc1_console)
  set(:gns3server_port, console)
  run "show ip", on: :gns3server
  expect get(:pc1_ip)

  target "Configurar pc2 ip #{get(:pc2_ip)}"
  console = get(:pc2_console)
  set(:gns3server_port, console)
  run "show ip", on: :gns3server
  expect get(:pc2_ip)

end
