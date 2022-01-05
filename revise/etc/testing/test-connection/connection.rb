
group "GNU/Linux connections" do

  set(:host1_ip, get(:linux_ip))
  set(:host2_ip, get(:linux_ip))
  set(:host3_ip, get(:linux_ip))
  set(:host4_ip, get(:linux_ip))

  target "host1 SSH with <#{get(:host1_username)}> "
  goto   :host1, :exec => "ip a"
  expect get(:host1_ip)

  target "host2 SSH with <#{get(:host2_username)}> "
  goto   :host2, :exec => "ip a"
  expect get(:host2_ip)

  target "host3 Telnet with <#{get(:host3_username)}> "
  goto   :host3, :exec => "ip a"
  expect get(:host3_ip)

  target "host4 Telnet with <#{get(:host4_username)}> "
  goto   :host4, :exec => "ip a"
  expect get(:host4_ip)

end

group "Windows connections" do

  set(:win1_ip, get(:windows_ip))
  set(:win2_ip, get(:windows_ip))
  set(:win3_ip, get(:windows_ip))
  set(:win4_ip, get(:windows_ip))

  target "win1 SSH with <#{get(:win1_username)}> "
  goto   :win1, :exec => 'get-windowsfeature -name rds-rd-server', :encoding => 'ISO-8859-1'
  result.debug
  expect result.find("[ ]").count.eq 1

  target "win2 SSH with <#{get(:win2_username)}> "
  goto   :win2, :exec => 'whoami'
  expect get(:win2_username)

  target "win3 Telnet with <#{get(:win3_username)}> "
  goto   :win3, :exec => "whoami"
  expect result.find(get(:win3_username)[1,40]).count.eq 2

  target "win4 Telnet with <#{get(:win4_username)}> "
  goto   :win4, :exec => "whoami"
  expect result.find(get(:win4_username)[1,40]).count.eq 2

end
