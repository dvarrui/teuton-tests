group "Comprobar las conexiones" do

  target "ping PC1 -> PC2"
  console = get(:pc1_console)
  remote_ip = get(:pc2_ip)
  cmd1 = "ping #{remote_ip} -c 4"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://127.0.0.1:#{console}"
  run cmd2
  expect "bytes from"

  target "ping PC2 -> PC1"
  console = get(:pc2_console)
  remote_ip = get(:pc1_ip)
  cmd1 = "ping #{remote_ip} -c 4"
  cmd2 = "echo \"#{cmd1}\" | curl -m 1 telnet://127.0.0.1:#{console}"
  run cmd2
  expect "bytes from"

end
