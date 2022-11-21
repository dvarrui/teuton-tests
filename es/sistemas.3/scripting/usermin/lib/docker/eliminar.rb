group "Opción --eliminar USERNAME" do
  docker = _cmd.join(" ")
  script = docker + _script
  script.gsub!("FOLDER", _folder)
  cmd.gsub!("PWD", _pwd)

  users = _eliminar
  peso = 20.0/users.size

  for name in users do
    target "script --eliminar #{name}", weight: peso
    run "#{script} --eliminar #{name}", on: :host1
    run "#{docker} id #{name}", on: :host1
    expect_one name
  end
end
