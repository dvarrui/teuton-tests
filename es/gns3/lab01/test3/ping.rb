group "Comprobar las conexiones" do

  target "ping PC1 -> PC2"
  console = get(:pc1_console)
  set(:gns3server_port, console)
  cmd = "ping #{get(:pc2_ip)} -c 4"
  run cmd, on: :gns3server
  expect "bytes from"

  target "ping PC2 -> PC1"
  console = get(:pc2_console)
  set(:gns3server_port, console)
  cmd = "ping #{get(:pc1_ip)} -c 4"
  run cmd
  expect "bytes from"

end
