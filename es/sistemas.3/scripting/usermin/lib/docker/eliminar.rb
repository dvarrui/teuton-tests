group "Opción --eliminar USERNAME" do
  docker = get(:cmd).join(" ")
  script = docker + get(:script)
  script.gsub!("FOLDER", get(:folder))

  users = get(:eliminar)
  peso = 20.0/users.size

  for name in users do
    target "script --eliminar #{name}", weight: peso
    run "#{script} --eliminar #{name}", on: :host1
    run "#{docker} id #{name}", on: :host1
    expect_one name
  end
end
