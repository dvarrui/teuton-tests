
group "Windows Server external configuration" do
  set :winserver_ip, "#{get(:ip_prefix)}#{get(:number).to_i}#{get(:ip_sufix)}"

  target "Must be conectivity with #{gett(:winserver_ip)}>"
  goto   :localhost, :exec => "ping #{get(:winserver_ip)} -c 1"
  expect_one ', 0% packet loss'

  # Execute command once
  goto   :localhost, :exec => "nmap -Pn #{get(:winserver_ip)}"
  ports=[ [ '22/tcp' , 'ssh'],
          [ '139/tcp', 'netbios-ssn'] ]

  ports.each do |port|
    target "Host #{get(:winserver_ip)} need port #{port[0]} open"
    # Eval result several times over the same original result
    result.restore!
    expect_one [ port[0], 'open', port[1] ]
  end
end

group "Windows Server Student personal configurations" do
  target "Exist #{get(:firstname)} home dir"
  goto   :winserver, :exec => "dir c:\\Users"
  expect_one get(:firstname)

  pcname = "#{get(:lastname1)}#{get(:number)}s1"
  target "Windows COMPUTERNAME"
  goto   :winserver, :exec => 'set'
  expect_one [ 'COMPUTERNAME', pcname.upcase ]

  #WARNING: error de acceso denegado!
  #target "Windows1 WORKGROUP_NAME"
  #goto   :host1, :exec => "net config workstation"
  #expect result.find!("Dominio de estaci").find!("de trabajo").find!(get(:host1_domain).to_s.upcase).count!.eq 1
end

group "Windows Server version" do
  target "Windows version is #{gett(:winserver_version)}"
  goto   :winserver, :exec => 'ver'
  expect_one [ 'Windows', get(:winserver_version) ]

  target "Windows ProductName is #{gett(:winserver_productname)}"
  goto   :winserver, :exec => "reg query \"HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\" /t REG_SZ"
  expect_one [ 'ProductName', get(:winserver_productname) ]
end

group "Windows Server network configurations" do
  goto :winserver, :exec => "ipconfig /all"
  mac = result.find!("Direcci").content[0]
  log    ("winserver_MAC = #{mac}")
  unique "MAC", mac
  # getmac command => MAC number

  target "Gateway IP is #{gett(:gateway_ip)}."
  goto   :winserver, :exec => 'ipconfig'
  expect_one [ 'enlace', get(:gateway_ip) ]

  target "WWW routing working"
  goto   :winserver, :exec => 'ping 8.8.4.4'
  expect "Respuesta"

  target "DNS working"
  goto   :winserver, :exec => "nslookup www.iespuertodelacruz.es"
  expect_one [ "Address:", "88.198.18.148" ]
end
