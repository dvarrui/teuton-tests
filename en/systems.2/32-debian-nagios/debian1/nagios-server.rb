
group "Configure Nagios Server" do

  packages=['nagios3', 'nagios3-doc', 'nagios-nrpe-plugin']

  packages.each do |package|
    target "Package #{package} installed"
    run "dpkg -l #{package}", on: :debian1
    expect_one 'ii'
  end

  dir="/etc/nagios3/#{get(:firstname)}.d"
  target "Directory <#{dir}> exist"
  run "file #{dir}", on: :debian1
  expect_one 'directory'

  files=['grupos','grupo-de-routers','grupo-de-servidores','grupo-de-clientes']
  pathtofiles=[]
  files.each do |file|
    f=dir+"/"+file+@student_number+".cfg"
    target "File <#{f}> exist"
    run "file #{f}", on: :debian1
    expect_one 'text'

    pathtofiles << f
  end

  # grupos.XX.cfg
  f = pathtofiles.select { |i| i.include? 'grupos'}
  filepath = f[0]

  target "<#{filepath}> content"
  run "cat #{filepath}| grep 'hostgroup_name' |wc -l", on: :debian1
  expect result.eq 3

  target "<#{filepath}> content"
  run "cat #{filepath}| grep 'hostgroup_name'|grep 'routers#{@student_number}' |wc -l", on: :debian1
  expect result.eq 1

  target "<#{filepath}> content"
  run "cat #{filepath}| grep 'hostgroup_name'|grep 'servidores#{@student_number}' |wc -l", on: :debian1
  expect result.eq 1

  target "<#{filepath}> content"
  run "cat #{filepath}", on: :debian1
  expect_one [ "hostgroup_name", "clientes#{@student_number}" ]

  # grupo-de-routersXX.cfg
  f = pathtofiles.select { |i| i.include? 'grupo-de-routers'}
  filepath = f[0]

  target "<#{filepath}> content"
  run "cat #{filepath}| grep 'define host' |wc -l", on: :debian1
  expect result.eq 2

  target "<#{filepath}> content"
  run "cat #{filepath}", on: :debian1
  expect_one [ "host_name", "bender#{@student_number}" ]

  # Router bender
  target "<#{filepath}> content Router bender address"
  run "cat #{filepath}", on: :debian1
  expect_one [ "address", get(:bender_ip) ]

  target "<#{filepath}> content Router bender host_name"
  run "cat #{filepath}", on: :debian1
  expect_one [ "host_name", "bender#{@student_number}" ]

  target "<#{filepath}> content Router caronte address"
  run "cat #{filepath}", on: :debian1
  expect_one [ "address", get(:caronte_ip) ]

  target "<#{filepath}> content: Router caronte host_name"
  run "cat #{filepath}", on: :debian1
  expect_one [ "host_name", "caronte#{@student_number}" ]

  target "<#{filepath}> content: <parent>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "parent", "bender#{@student_number}" ]

  # grupo-de-servidoresXX.cfg
  f = pathtofiles.select { |i| i.include? 'grupo-de-servidores'}
  filepath = f[0]

  target "<#{filepath}> content: <define hosts> ???"
  run "cat #{filepath}", on: :debian1
  expect_one "define host"

  target "<#{filepath}> content: <host_name leela#{@student_number}>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "host_name", "leela#{@student_number}" ]

  target "<#{filepath}> content: <address #{get(:leela_ip)}>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "address", get(:leela_ip) ]

  target "<#{filepath}> content: <parents bender#{@student_number}>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "parents", "bender#{@student_number}" ]

  # grupo-de-clientesXX.cfg
  f = pathtofiles.select { |i| i.include? 'grupo-de-clientes'}
  filepath = f[0]

  target "<#{filepath}> content: <define host>"
  run "cat #{filepath}| grep 'define host'", on: :debian1
  expect result.count.eq 2

  @short_hostname[2] = "#{get(:lastname1)}#{@student_number}e"
  @long_hostname[2] = "#{@short_hostname[2]}.#{get(:domain)}}"

  target "<#{filepath}> content: <host_name #{@short_hostname[2]}>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "host_name", @short_hostname[2] ]

  target "<#{filepath}> content: <address #{get(:debian2_ip)}>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "address", get(:debian2_ip) ]

  @short_hostname[3] = "#{get(:lastname1)}#{@student_number}w"
  @long_hostname[3] = "#{@short_hostname[3]}.#{get(:domain)}}"

  target "<#{filepath}> content <host_name #{@short_hostname[3]}>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "host_name", @short_hostname[3] ]

  target "<#{filepath}> content: <address #{get(:windows1_ip)}>"
  run "cat #{filepath}", on: :debian1
  expect_one [ "address", get(:windows1_ip) ]

end

group "Debian1: Restart Nagios service" do

  target "Debian1: Stop agent service"
  run "service nagios3 stop", on: :debian1
  run "service nagios3 status", on: :debian1
  expect_one [ "Active", "inactive" ]

  target "Debian1: Start agent service", :weight => 5
  run "service nagios3 start", on: :debian1
  run "service nagios3 status", on: :debian1
  expect_one [ "Active", "active" ]
end
