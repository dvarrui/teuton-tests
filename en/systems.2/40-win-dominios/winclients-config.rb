
group "External configurations: wincli1 and wincli2" do

  winclients=[
           { :label      => 'wincli1',
             :goto       => :wincli1,
             :ip         => :wincli1_ip,
             :short_name => get(:wincli1_sname).upcase } ,
           { :label      => 'wincli2',
             :goto       => :wincli2,
             :ip         => :wincli2_ip,
             :short_name => get(:wincli2_sname).upcase }
          ]

  winclients.each do |cli|
    target "Ping conection to #{gett(cli[:ip])}"
    goto   :localhost, :exec => "ping #{get(cli[:ip])} -c 1"
    expect_none "Destination Host Unreachable"

    #Execute command once. Use result.restore
    goto   :localhost, :exec => "nmap -Pn #{get(cli[:ip])}"

    ports=[ [ '23/tcp' , 'telnet'],
            [ '135/tcp', 'msrpc' ] ]

    ports.each do |port|
      target "#{cli[:label]} #{get(cli[:ip])} port #{port[0]}"
      result.restore! # Eval result several times over the same original result
      expect_one [ port[0], "open", port[1] ]
    end
  end
end

group "Internal configurations: wincli1 and wincli2" do

  winclients=[
           { :label       => 'wincli1',
             :goto        => :wincli1,
             :ip          => :wincli1_ip,
             :sname       => get(:wincli1_sname).upcase,
             :productname => get(:wincli1_productname) } ,
           { :label       => 'wincli2',
             :goto        => :wincli2,
             :ip          => :wincli2_ip,
             :sname       => get(:wincli2_sname).upcase,
             :productname => get(:wincli2_productname) }
         ]

  winclients.each do |cli|
    goto cli[:goto], :exec => "ipconfig /all"
    mac = result.find!("Direcci").content[0]
    log    ("#{cli[:label]}_MAC = #{mac}")
    unique "MAC", mac

    target "#{cli[:label]} version"
    goto   cli[:goto], :exec => "ver"
    expect_one [ "Windows","6.1" ]

    target "#{cli[:label]} COMPUTERNAME"
    goto   cli[:goto], :exec => "set"
    expect_one [ "COMPUTERNAME", cli[:sname] ]

    target "#{cli[:label]} enlace #{gett(:gateway)}"
    goto   cli[:goto], :exec => "ipconfig"
    expect_one [ "enlace", get(:gateway) ]

    target "#{cli[:label]} router OK"
    goto   cli[:goto], :exec => "ping 8.8.4.4"
    expect "Respuesta"

    target "#{cli[:label]} DNS OK"
    goto   cli[:goto], :exec => "nslookup www.iespuertodelacruz.es"
    expect_one  [ "Address:", "88.198.18.148" ]

#  target "Windows1 WORKGROUP_NAME"
#  goto :windows1, :exec => "net config workstation"
#  expect result.find!("Dominio de estaci").find!("de trabajo").find!(get(:domain).to_s.upcase).count!.eq 1

    target "#{cli[:label]} ProductName"
    goto   cli[:goto], :exec => "reg query \"HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\" /t REG_SZ"
    expect_one [ "ProductName", cli[:productname] ]
  end
end

group "Ping from wincli1 to *" do
  target "ping wincli1 to #{gett(:winserver_ip)}"
  goto   :wincli1, :exec => "ping #{get(:winserver_ip)}"
  expect "Respuesta"

  target "ping wincli1 to #{gett(:winserver_sname)}"
  goto   :wincli1, :exec => "ping #{get(:winserver_sname)}"
  expect "Respuesta"

  target "ping wincli1 to #{gett(:wincli2_ip)}"
  goto   :wincli1, :exec => "ping #{get(:wincli2_ip)}"
  expect "Respuesta"

  target "ping wincli1 to #{gett(:wincli2_sname)}"
  goto   :wincli1, :exec => "ping #{get(:wincli2_sname)}"
  expect "Respuesta"
end

group "Ping from wincli2 to *" do
  target "ping wincli2 to #{gett(:winserver_ip)}"
  goto   :wincli2, :exec => "ping #{get(:winserver_ip)}"
  expect "Respuesta"

  target "ping wincli2 to #{gett(:winserver_sname)}"
  goto   :wincli2, :exec => "ping #{get(:winserver_sname)}"
  expect "Respuesta"

  target "ping wincli2 to #{gett(:wincli1_ip)}"
  goto   :wincli2, :exec => "ping #{get(:wincli1_ip)}"
  expect "Respuesta"

  target "ping wincli2 to #{gett(:wincli1_sname)}"
  goto   :wincli2, :exec => "ping #{get(:wincli1_sname)}"
  expect "Respuesta"
end
