group "Configurar las interfaces de red" do

  target "Configurar pc1 ip #{get(:pc1_ip)}"
  console = get(:pc1_console)
  cmd1 = "show ip"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://#{get(:host_ip)}:#{console}"
  run cmd2, on: :host
  expect get(:pc1_ip)
 
  target "Configurar pc2 ip #{get(:pc2_ip)}"
  console = get(:pc2_console)
  cmd1 = "show ip"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://#{get(:host_ip)}:#{console}"
  run "show ip", on: :host
  expect get(:pc2_ip)

end
