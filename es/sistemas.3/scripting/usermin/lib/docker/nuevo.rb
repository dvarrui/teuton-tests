group "Opción --nuevo USERNAME" do
  docker = _cmd.join(" ")
  docker.gsub!("FOLDER", _folder)
  cmd.gsub!("PWD", _pwd)

  script = docker + _script
  script.gsub!("FOLDER", _folder)
  cmd.gsub!("PWD", _pwd)

  users = _nuevo
  peso = 20.0/users.size

  for name in users do
    target "script --nuevo #{name}", weight: peso
    run "#{script} --nuevo #{name} teuton /bin/bash 123456", on: :host1
    run "#{docker} cat /etc/passwd", on: :host1
    expect_one ":100:teuton:/home/#{name}:/bin/bash"
  end
end
