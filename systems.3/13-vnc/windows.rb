
group "Windows: external configuration" do
  target "Ensure ping to #{gett(:win_ip)} is working.", :weight => 0.1
  goto :localhost, :exec => "ping #{get(:win_ip)} -c 1"
  expect_one "0% packet loss,"

  target "Ensure VNC port is open on #{gett(:win_ip)}.", :weight => 0.1
  goto :localhost, :exec => "nmap -Pn #{get(:win_ip)}"
  expect [ 'vnc', 'open', '5900']
end

group "Windows: Slave VNC" do
  readme 'Keep Open VNC connections to Slave VNC'

  target "Open VNC session from #{gett(:masterwin_ip)}"
  # goto :host, :exec => 'command', :encoding => 'ISO-8859-1'"
  goto :win, :exec => "netstat -n"
  expect [ "#{get(:win_ip)}:5900", get(:masterwin_ip), "ESTABLISHED" ]

  target "Open VNC session from #{gett(:mastersuse_ip)}"
  goto :win, :exec => "netstat -n"
  expect [ "#{get(:win_ip)}:5900", get(:mastersuse_ip), "ESTABLISHED" ]
end
