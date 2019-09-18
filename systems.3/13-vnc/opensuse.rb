
group "OpenSUSE: Slave VNC" do
  readme 'Keep Open VNC connections to Slave VNC'
  
  target "Open VNC session from #{gett(:mastersuse_ip)}"
  goto :suse, :exec => "lsof -i -n"
  expect [ "#{get(:suse_ip)}:vnc", get(:mastersuse_ip)]

  target "Open VNC session from #{gett(:masterwin_ip)}"
  goto :suse, :exec => "lsof -i -n"
  expect [ "#{get(:suse_ip)}:vnc", get(:masterwin_ip)]
end
