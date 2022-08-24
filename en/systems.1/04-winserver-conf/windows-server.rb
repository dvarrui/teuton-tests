
group "Windows Server external configuration" do
  set :winserver_ip, "#{get(:ip_prefix)}#{get(:number).to_i}#{get(:ip_sufix)}"

  target "Must be conectivity with #{gett(:winserver_ip)}>"
  run "ping #{get(:winserver_ip)} -c 1"
  expect_one ', 0% packet loss'

  # Execute command once
  run "nmap -Pn #{get(:winserver_ip)}"
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
  run "dir c:\\Users", on: :winserver
  expect_one get(:firstname)

  pcname = "#{get(:lastname1)}#{get(:number)}s1"
  target "Windows COMPUTERNAME"
  run 'set', on: :winserver
  expect_one [ 'COMPUTERNAME', pcname.upcase ]

  #WARNING: error de acceso denegado!
  #target "Windows1 WORKGROUP_NAME"
  #goto   :host1, :exec => "net config workstation"
  #expect result.find!("Dominio de estaci").find!("de trabajo").find!(get(:host1_domain).to_s.upcase).count!.eq 1
end

group "Windows Server version" do
  target "Windows version is #{gett(:winserver_version)}"
  run 'ver', on: :winserver
  expect_one [ 'Windows', get(:winserver_version) ]

  target "Windows ProductName is #{gett(:winserver_productname)}"
  run "reg query \"HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\" /t REG_SZ", on: :winserver
  expect_one [ 'ProductName', get(:winserver_productname) ]
end

