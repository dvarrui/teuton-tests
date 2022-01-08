
group "Master check hostnames" do
  list = [
    { :ip => :master_ip, :hostname => :master_hostname},
    { :ip => :client1_ip, :hostname => :client1_hostname},
    { :ip => :client2_ip, :hostname => :client2_hostname}
  ]

  goto :master, :exec => "cat /etc/hosts"
  list.each do |i|
    target "Create host/IP association for #{get(i[:ip])}."
    readme "Revise /etc/hosts file."
    result.restore!
    expect_one [ get(i[:ip]), get(i[:hostname]) ]
  end
end

task "Master software" do
  packages = ['rubygem-puppet-master', 'rubygem-puppet']

  packages.each do |packagename|
    target "Install package #{packagename}."
    goto :master, :exec => "zypper se #{packagename}"
    expect [ 'i ', packagename ]
  end

  goto :master, :exec => "systemctl status puppetmaster"
  target "Ensure puppetmaster service is active."
  result.restore!
  expect_one [ 'Active: ', 'running' ]

  target "Ensure puppetmaster service is enable"
  result.restore!
  expect_one [ 'Loaded: ', ' enable' ]
end

task "Master: puppet files" do
  target "<site.pp> created"
  goto :master, :exec => "file /etc/puppet/manifests/site.pp"
  expect result.find!('ASCII text').count!.eq(1)

  files = ['hostlinux1.pp', 'hostlinux2.pp', 'hostwindows3.pp', 'hostwindows4.pp']

  files.each do |filename|
    target "<" + filename + "> created"
    goto :master, :exec => "file /etc/puppet/manifests/classes/#{filename}"
    expect result.find!('ASCII text').count!.eq(1)
  end
end

task "Master: certificates" do
  certname = "cli1alu" + get(:number).to_s + '.' + get(:client1_domain)
  target "Certificates <#{certname}> accepted"
  goto :master, :exec => "puppet cert print #{certname}"
  expect result.count!.neq(0)

  certname = 'cli2alu' + get(:number)
  target "Certificates <#{certname}> accepted"
  goto :master, :exec => "puppet cert print #{certname}"
  expect result.count!.neq(0)
end
