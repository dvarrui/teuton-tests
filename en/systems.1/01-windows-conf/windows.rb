
group "Settings" do
  ip = "#{get(:ip_prefix)}#{get(:number).to_i.to_s}#{get(:ip_sufix)}"
  set :win_ip, ip
end

group "Windows external configuration" do
  target "Conection with #{gett(:win_ip)} working"
  run "ping #{get(:win_ip)} -c 1"
  expect_one ", 0% packet loss"

  # Execute this only command once
  run "nmap -Pn #{get(:win_ip)}"

  ports=[ [ '22/tcp' , 'ssh'],
          [ '139/tcp', 'netbios-ssn'] ]
  ports.each do |port|
    target "Windows #{gett(:win_ip)} port #{port[0]} must be opened"
    result.restore!
    # Eval result several times over the same original result
    expect_one [port[0], 'open', port[1]]
  end
end

group "Windows Student personal configurations" do
  target "User #{gett(:firstname)} home dir"
  run :exec => "dir c:\\Users", on: :win
  expect_one get(:firstname)

  pcname = "#{get(:lastname)}#{get(:number)}w1"
  target "Windows COMPUTERNAME equal to #{pcname}"
  run 'set', on: :win
  expect_one ["COMPUTERNAME", pcname.upcase]

  #WARINING: error de acceso denegado!
  #target "Windows1 WORKGROUP_NAME"
  #goto   :host1, :exec => "net config workstation"
  #expect result.find!("Dominio de estaci").find!("de trabajo").find!(get(:host1_domain).to_s.upcase).count!.eq 1
end

group "Windows version" do
  target "Windows version #{gett(:win_version)}"
  run "ver", on: :win
  expect_one ["Windows", get(:win_version)]

  target "Windows ProductName #{gett(:win_productname)}"
  run "reg query \"HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\" /t REG_SZ", on: :win
  expect_one ["ProductName", get(:win_productname)]
end

group "Windows network configurations" do
  run "ipconfig /all", on: :win
  mac = result.find!("Direcci").content[0]
  log    ("win_MAC = #{mac}")
  unique "MAC", mac
  #getmac command => MAC number

  target "Gateway IP equal to #{gett(:gateway_ip)}"
  run "ipconfig", on: :win
  expect_one ["enlace", get(:gateway_ip)]

  target "Internet routing working"
  run "ping 8.8.4.4", on: :win
  expect "Respuesta"

  target "DNS configuration working"
  run "nslookup www.iespuertodelacruz.es", on: :win
  expect_one ["Address:", "88.198.18.148"]
end
