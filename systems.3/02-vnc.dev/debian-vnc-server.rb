
group "Debian: VNC server" do
  target "Install Tightvncserver on #{gett(:debian_ip)}"
  goto :debian, :exec => "dpkg -l"
  expect_one [ 'tightvncserver', 'ii' ]

  #command "ps -ef| grep tightvnc| grep geometry| wc -l", :tempfile => 'tightvnc.tmp'
  #vncserver :1

  target "Activate VNC services on #{gett(:debian_ip)}"
  run "nmap -Pn #{get(:debian_ip)}"
  expect_one [ 'vnc', 'open' ]

  target "Services active on IP/port #{get(:debian_ip)}/6001"
  result.restore!
  expect '6001'
end
