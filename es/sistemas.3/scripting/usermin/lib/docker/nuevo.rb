group "Opción --nuevo USERNAME" do
  docker = get(:cmd).join(" ")
  docker.gsub!("FOLDER", get(:folder))
  script = docker + get(:script)
  script.gsub!("FOLDER", get(:folder))

  users = get(:nuevo)
  peso = 20.0/users.size

  for name in users do
    target "script --nuevo #{name}", weight: peso
    run "#{script} --nuevo #{name} teuton /bin/bash 123456", on: :host1
    run "#{docker} cat /etc/passwd", on: :host1
    expect_one ":100:teuton:/home/#{name}:/bin/bash"
  end
end
