
task "Client1 check hostnames" do
  list = [
    { :ip => :master_ip, :hostname => :master_hostname},
    { :ip => :client1_ip, :hostname => :client1_hostname},
    { :ip => :client2_ip, :hostname => :client2_hostname}
  ]

  goto :client1, :exec => "cat /etc/hosts"
  list.each do |i|
    target "Create host/IP association for #{get(i[:ip])}."
    readme "Revise /etc/hosts file."
    result.restore!
    expect_one [ get(i[:ip]), get(i[:hostname]) ]
  end
end

task "Client1 software" do
  packages = ['rubygem-puppet']

  packages.each do |packagename|
    target "<" + packagename + "> installed"
    goto :client1, :exec => "zypper se #{packagename}"
    expect result.find!('i ').find!(packagename).count!.ge(1)
  end

  goto :client1, :exec => "systemctl status puppet"
  target "Service <puppet> active"
  result.restore!
  expect result.find!('Active: ').find!('running').count!.eq(1)

  target "Service <puppet> enable"
  result.restore!
  expect result.find!('Loaded: ').find!(' enable').count!.eq(1)
end

task "Client1: puppet.conf files" do
  target "puppet.conf"
  goto :client1, :exec => "cat /etc/puppet/puppet.conf"
  expect result.find!('server').find!('master'+get(:number)).count!.eq(1)
end
