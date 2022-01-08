
group "OpenSUSE: external configuration" do
  readme 'Run this commands from GNU/Linux OS system.'

  target "Ensure ping to #{gett(:suse_ip)} is working.", :weight => 0.1
  goto :localhost, :exec => "ping #{get(:suse_ip)} -c 1"
  expect_one "0% packet loss,"

  target "Ensure VNC port is open on #{gett(:suse_ip)}.", :weight => 0.1
  goto :localhost, :exec => "nmap -Pn #{get(:suse_ip)}"
  expect [ 'vnc', 'open', '5900']
end

group "OpenSUSE: Slave VNC" do
  readme 'Keep Open VNC connections to Slave VNC.'

  target "Open VNC session from #{gett(:mastersuse_ip)}."
  goto :suse, :exec => "lsof -i -n"
  expect [ "#{get(:suse_ip)}:vnc", get(:mastersuse_ip)]

  target "Open VNC session from #{gett(:masterwin_ip)}."
  goto :suse, :exec => "lsof -i -n"
  expect [ "#{get(:suse_ip)}:vnc", get(:masterwin_ip)]
end
