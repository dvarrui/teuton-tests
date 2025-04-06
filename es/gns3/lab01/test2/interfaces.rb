group "Configurar las interfaces de red" do
  readme "NOTA:"
  readme "- GNS3 debe estar iniciado con el proyecto abierto"
  readme "- Los dispositivos deben estar iniciados"

  target "Configurar pc1 ip <#{get(:pc1_ip)}>"
  console = get(:pc1_console)
  cmd1 = "show ip"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://#{get(:gns3server_ip)}:#{console}"
  run cmd2, on: :host
  expect get(:pc1_ip)
 
  target "Configurar pc2 ip <#{get(:pc2_ip)}>"
  console = get(:pc2_console)
  cmd1 = "show ip"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://#{get(:gns3server_ip)}:#{console}"
  run cmd2, on: :host
  expect get(:pc2_ip)

end

group "Comprobar la conectividad entre los dispositivos" do
  readme "NOTA:"
  readme "- GNS3 debe estar iniciado con el proyecto abierto"
  readme "- Los dispositivos deben estar iniciados"

  target "ping pc1 -> pc2"
  console = get(:pc1_console)
  cmd1 = "ping #{get(:pc2_ip)} -c 4"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://#{get(:gns3server_ip)}:#{console}"
  run cmd2
  expect "bytes from"

  target "ping pc2 -> pc1"
  console = get(:pc2_console)
  cmd1 = "ping #{get(:pc1_ip)} -c 4"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://#{get(:gns3server_ip)}:#{console}"
  run cmd2
  expect "bytes from"

end
