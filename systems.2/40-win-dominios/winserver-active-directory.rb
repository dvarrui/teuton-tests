
groups "WinServer Domain Groups" do

  groups= [ 'jedi1617', 'sith1617']
  if get(:domain).nil? then
    set(:domain,"falta.dominio")
  end
  domains = get(:domain).split('.')
  names = []

  groups.each do |group|
    names << "CN=#{group},CN=Users,DC=#{domains[0]},DC=#{domains[1]}"
  end

  goto :winserver, :exec => "dsquery group domainroot"
  names.each do |name|
    target "Domain group <#{name}>"
    result.restore!
    expect_one name
  end
end

group "winserver domain users" do

  users = [ 'obiwan', 'maul']
  domains = get(:domain).split(".")
  names = []

  users.each do |user|
    names << "CN=#{user},CN=Users,DC=#{domains[0]},DC=#{domains[1]}"
  end

  goto :winserver, :exec => "dsquery user domainroot"
  names.each do |name|
    target "Domain user <#{name}>"
    result.restore!
    expect_one name
  end
end

group "WinServer Domain Computers" do

  computers = [ get(:wincli1_sname).upcase, get(:wincli2_sname).upcase]
  domains = get(:domain).split(".")
  names = []

  computers.each do |user|
    names << "CN=#{user},CN=Computers,DC=#{domains[0]},DC=#{domains[1]}"
  end

  goto :winserver, :exec => "dsquery computer domainroot"
  names.each do |name|
    target "Domain computer <#{name}>"
    result.restore!
    expect_one name
  end
end

group "WinServer profiles" do
  target "Profile Directory #{gett(:profiles_dir)}"
  goto   :winserver, :exec => "dir e:"
  expect_one  [get(:profiles_dir), "DIR"]

  users= [ 'obiwan', 'maul' ]
  goto   :winserver, :exec => "dir e:\\#{get(:profiles_dir)}"
  users.each do |user|
    target "Profile Directory for user <#{user}>"
    result.restore!
    expect_one [user, ".V2"]
  end
end

=begin
  file='maul.V2\\Desktop\\sith\\personajes.txt'
  target "Content of <#{file}>"
  goto   :winserver, :exec => "type e:\\#{get(:profiles_dir)}\\#{file}"
  expect result.count!.eq 2

  target "Content of <#{file}> with vader"
  result.restore!
  expect result.find!("vader").count!.eq 1

  target "Content of <#{file}> with maul"
  result.restore!
  expect result.find!("maul").count!.eq 1

  file='obiwan.V2\\Desktop\\jedi\\personajes.txt'
  target "Content of <#{file}>"
  goto   :winserver, :exec => "type e:\\#{get(:profiles_dir)}\\#{file}"
  expect result.count!.eq 2

  target "Content of <#{file}> with obiwan"
  result.restore!
  expect result.find!("obiwan").count!.eq 1

  target "Content of <#{file}> with yoda"
  result.restore!
  expect result.find!("yoda").count!.eq 1
=end
