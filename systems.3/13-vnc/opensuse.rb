
group "OpenSUSE: Slave VNC" do

  target "Open VNC session from #{gett(:mastersuse_ip)}"
  goto :suse, :exec => "lsof -i -n"
  expect [ get(:suse_ip), get(:mastersuse_ip), 'vnc']

  target "Open VNC session from #{gett(:masterwin_ip)}"
  goto :suse, :exec => "lsof -i -n"
  expect [ get(:suse_ip), get(:masterwin_ip), 'vnc']

end
