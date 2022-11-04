group "Opción --eliminar USERNAME" do
  docker = get(:cmd).join(" ")
  script = docker + get(:script)

  users = get(:eliminar)
  peso = 20.0/users.size

  users.each do |name|
    target "script --eliminar #{name}", weight: peso
    run "#{script} --eliminar #{name}", on: :host1
    run "#{docker} id #{name}", on: :host1
    expect_one name
  end
end
