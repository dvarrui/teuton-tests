group "Opción --nuevo USERNAME" do
  users = _nuevo
  peso = 20.0/users.size

  for name in users do
    target "script --nuevo #{name}", weight: peso
    run "#{_script} --nuevo #{name} teuton /bin/bash 123456", on: :host1
    run "#{_docker} cat /etc/passwd", on: :host1
    expect_one ":100:teuton:/home/#{name}:/bin/bash"
  end
end
