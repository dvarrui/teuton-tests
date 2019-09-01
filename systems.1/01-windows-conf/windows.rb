
group "Windows external configuration" do
  set :host1_ip, "#{get(:ip_prefix)}#{get(:number).to_i.to_s}#{get(:ip_sufix)}"

  target "Conection with #{gett(:host1_ip)} working"
  goto   :localhost, :exec => "ping #{get(:host1_ip)} -c 1"
  expect_one ", 0% packet loss"

  # Execute this only command once
  goto   :localhost, :exec => "nmap -Pn #{get(:host1_ip)}"

  ports=[ [ '22/tcp' , 'ssh'],
          [ '139/tcp', 'netbios-ssn'] ]
  ports.each do |port|
    target "Windows #{gett(:host1_ip)} port #{port[0]} must be opened"
    result.restore!
    # Eval result several times over the same original result
    expect_one [port[0], 'open', port[1]]
  end
end

group "Windows Student personal configurations" do
  target "User #{gett(:firstname)} home dir"
  goto   :host1, :exec => "dir c:\\Users"
  expect_one get(:firstname)
  #expect result.find!(get(:username)[1,99]).count!.eq 1

  pcname = "#{get(:lastname1)}#{get(:number)}w1"
  target "Windows COMPUTERNAME equal to #{pcname}"
  goto   :host1, :exec => 'set'
  expect_one ["COMPUTERNAME", pcname.upcase]

  #WARINING: error de acceso denegado!
  #target "Windows1 WORKGROUP_NAME"
  #goto   :host1, :exec => "net config workstation"
  #expect result.find!("Dominio de estaci").find!("de trabajo").find!(get(:host1_domain).to_s.upcase).count!.eq 1
end

group "Windows version" do
  target "Windows version #{gett(:host1_version)}"
  goto   :host1, :exec => "ver"
  expect_one ["Windows", get(:host1_version)]

  target "Windows ProductName #{gett(:host1_productname)}"
  goto   :host1, :exec => "reg query \"HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\" /t REG_SZ"
  expect_one ["ProductName", get(:host1_productname)]
end

group "Windows network configurations" do
  goto :host1, :exec => "ipconfig /all"
  mac = result.find!("Direcci").content[0]
  log    ("host1_MAC = #{mac}")
  unique "MAC", mac
  #getmac command => MAC number

  target "Gateway IP equal to #{gett(:gateway_ip)}"
  goto   :host1, :exec => "ipconfig"
  expect_one ["enlace", get(:gateway_ip)]

  target "Internet routing working"
  goto   :host1, :exec => "ping 8.8.4.4"
  expect "Respuesta"

  target "DNS configuration working"
  goto   :host1, :exec => "nslookup www.iespuertodelacruz.es"
  expect_one ["Address:", "88.198.18.148"]
end
