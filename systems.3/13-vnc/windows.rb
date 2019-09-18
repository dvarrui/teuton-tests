
group "Windows: Slave VNC" do

  target "Open VNC session from #{gett(:masterwin_ip)}"
  goto :win, :exec => "netstat -n"
  expect [ get(:win_ip), get(:masterwin_ip), 'vnc']

  target "Open VNC session from #{gett(:mastersuse_ip)}"
  goto :win, :exec => "netstat -n"
  expect [ get(:win_ip), get(:mastersuse_ip), 'vnc']
end
