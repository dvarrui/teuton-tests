
group "OpenSUSE: external configurations" do
  readme 'Ensure that the machine is accessible from the outside.'

  list = [ :server1_ip, :client1_ip]

  list.each do |i|
    target "Ping to #{gett(i)} working"
    goto :localhost, :exec => "ping #{get(i)} -c 1"
    expect_none '100% packet loss'

    target "Open SSH port 22 on #{gett(i)}"
    goto :localhost, :exec => "nmap #{get(i)} -Pn"
    expect_one [ 'ssh', 'open' ]
  end
end

group "OpenSUSE: student configurations" do
  readme "Each student must customize their machines according to the teacher's specifications."

  list = [
            {:name => :server1, :hostname => :server1_hostname },
            {:name => :client1, :hostname => :client1_hostname },
          ]

  list.each do |i|
    target "Set hostname to #{gett(i[:hostname])}"
    goto i[:name], :exec => "hostname -a"
    expect result.equal?(get(i[:hostname]))

    target "Set domain to #{gett(:domain)}"
    goto i[:name], :exec => "hostname -d"
    expect result.equal?(get(:domain))

    fqdn = get(i[:hostname]) + "." + get(:domain)
    target "Set host FQDN equal to #{fqdn}"
    goto i[:name], :exec => "hostname -f"
    expect result.equal?(fqdn)

    target "Create user #{gett(:username)}"
    goto i[:name], :exec => "cat /etc/passwd"
    expect_one "#{get(:username)}:"

    goto i[:name], :exec => "blkid |grep sda1"
    unique "#{i[:name]}_sda1_UUID", result.value
    goto i[:name], :exec => "blkid |grep sda2"
    unique "#{i[:name]}_sda2_UUID", result.value
  end
end

group "OpenSUSE: network configurations" do
  readme "Make sure the network settings are correct."

  list = [
            {:name => :server1, :hostname => :server1_hostname },
            {:name => :client1, :hostname => :client1_hostname },
          ]

  list.each do |i|
    goto i[:name], :exec => "ip a|grep ether"
    mac = result.value
    log    ("#{i[:name]}_MAC = #{mac}")
    unique "MAC", mac

    target "Set Gateway to #{gett(:gateway_ip)}"
    goto   i[:name], :exec => "route -n"
    expect_one [ "UG", get(:gateway_ip) ]

    target "Ensure WWW routing is working"
    goto   i[:name], :exec => "ping 88.198.18.148 -c 1"
    expect_one " 0% packet loss,"

    target "Ensure DNS is working"
    goto   i[:name], :exec => "nslookup www.iespuertodelacruz.es"
    expect_one [ "Address:", "88.198.18.148" ]
  end
end
