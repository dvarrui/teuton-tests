group "Opción --nuevo USERNAME" do
  cmd = get(:cmd).join(" ")

  peso = 20
  name = "demo"
  target "script --nuevo #{name}", weight: peso
  run "#{cmd} --nuevo #{name} teuton /bin/bash 123456; clear; id #{name}", on: :host1
  expect_one "(#{name}) "

  #users = [ "vader1", "obiwan2", "yoda3" ]
  #peso = 20.0/users.size

  #users.each do |name|
  #  target "script --nuevo #{name} teuton /bin/bash 123456", weight: peso
  #  run "#{cmd} --nuevo #{name}; clear; id #{name}", on: :host1
  #  expect_one "(#{name}) "
  #end
end
