group "red" do
  target "Conectividad"
  run "ping #{get(:host_ip)} -c 1"
  expect " 0% packet loss, "

  target "Servicio SSH"
  run "nmap -Pn #{get(:host_ip)}"
  expect [ '22/tcp', 'ssh' ]
end
