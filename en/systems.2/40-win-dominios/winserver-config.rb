
group "Set internal params..." do

  log "Setting internal params"

  if get(:winserver_ip).nil?
    set(:winserver_ip,"99.99.99.99")
  end
  student_number = get(:winserver_ip).split(".")[2]||"99"
  student_number = "0"+student_number if student_number.size==1
  set(:student_number, student_number)

  short_hostname = []
  long_hostname = []

  short_hostname[0]="#{get(:lastname1)}#{get(:student_number)}s"
  long_hostname[0]="#{short_hostname[0]}.#{get(:domain)}"

  set(:winserver_sname, short_hostname[0])
  set(:winserver_lname, long_hostname[0])

  short_hostname[1]="#{get(:lastname1)}#{get(:student_number)}w"
  long_hostname[1]="#{short_hostname[1]}.#{get(:domain)}"

  set(:wincli1_sname, short_hostname[1])
  set(:wincli1_lname, long_hostname[1])

  short_hostname[2]="#{get(:lastname1)}#{get(:student_number)}x"
  long_hostname[2]="#{short_hostname[2]}.#{get(:domain)}"

  set(:wincli2_sname, short_hostname[2])
  set(:wincli2_lname, long_hostname[2])
end

group "External configuration: WinServer" do
  target "Conection with <#{get(:winserver_ip)}>"
  goto :localhost, :exec => "ping #{get(:winserver_ip)} -c 1"
  expect_none "Destination Host Unreachable"

  ports=[ [ '23/tcp' , 'telnet'],
          [ '53/tcp' , 'domain'],
          [ '139/tcp', 'netbios-ssn'],
          [ '389/tcp', 'ldap' ] ]

  # Only one conection to get the command output
  goto :localhost, :exec => "nmap -Pn #{get(:winserver_ip)}"
  ports.each do |port|
    target "windserver #{get(:winserver_ip)} port #{port[0]}"
    result.restore! # Use the same original output to evaluate differents values
    expect_one [ port[0], "open", port[1] ]
  end
end

group "Internal configurations: WinServer" do

  goto   :winserver, :exec => "ipconfig /all"
  mac=result.find!("Direcci").content[0]
  log ("winserver_MAC = #{mac}")
  unique "MAC", mac

  target "winserver version"
  goto   :winserver, :exec => "ver"
  expect_one [ "Windows", "6.0.6002" ]

  target "winserver COMPUTERNAME"
  goto   :winserver, :exec => "set"
  expect_one [ "COMPUTERNAME", get(:winserver_sname).upcase ]

  target "winserver gateway <#{get(:gateway)}>"
  goto   :winserver, :exec => "ipconfig"
  expect_one [ "enlace", get(:gateway) ]

  target "winserver router OK"
  goto   :winserver, :exec => "ping 8.8.4.4"
  expect "Respuesta"

  target "winserver DNS OK"
  goto   :winserver, :exec => "nslookup www.iespuertodelacruz.es"
  expect_one [ "Address:", "88.198.18.148" ]

#  target "Windows1 WORKGROUP_NAME"
#  goto :windows1, :exec => "net config workstation"
#  expect result.find!("Dominio de estaci").find!("de trabajo").find!(get(:domain).to_s.upcase).count!.eq 1

  target "winserver ProductName"
  goto   :winserver, :exec => "reg query \"HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\" /t REG_SZ"
  expect_one [ "ProductName", "Windows Server", "2008" ]
end

group "Ping from winserver to *" do
  target "ping winserver to #{gett(:wincli1_ip)}"
  goto   :winserver, :exec => "ping #{gett(:wincli1_ip)}"
  expect "Respuesta"

  target "ping winserver to windows1_name"
  goto   :winserver, :exec => "ping #{gett(:wincli1_sname)}"
  expect "Respuesta"

  target "ping winserver to #{gett(:wincli2_ip)}"
  goto   :winserver, :exec => "ping #{get(:wincli2_ip)}"
  expect "Respuesta"

  target "ping winserver to windows2_name"
  goto   :winserver, :exec => "ping #{get(:wincli2_sname)}"
  expect "Respuesta"
end
