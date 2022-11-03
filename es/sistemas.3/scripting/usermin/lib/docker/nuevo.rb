group "Opción --nuevo USERNAME" do
  cmd = get(:cmd).join(" ")

  users = [ "vader1", "obiwan2", "yoda3" ]
  peso = 20.0/users.size

  users.each do |name|
    target "script --nuevo #{name} teuton /bin/bash 123456", weight: peso

    run "#{cmd} --nuevo #{name}", on: :host1
    run "id #{name}", on: :host1
    result.restore
    expect_one "(#{name}) "
  end
end
