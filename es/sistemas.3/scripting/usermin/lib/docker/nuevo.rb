group "Opción --nuevo USERNAME" do
  cmd = get(:cmd).join(" ") + get(:script)

  users = [ "vader1", "obiwan2", "yoda3" ]
  peso = 20.0/users.size

  users.each do |name|
    target "script --nuevo #{name}", weight: peso
    run "#{cmd} --nuevo #{name} teuton /bin/bash 123456", on: :host1
    run "cat temp/etc/passwd", on: :host1
    expect_one ":100:teuton:/home/#{name}:/bin/bash"
  end
end
