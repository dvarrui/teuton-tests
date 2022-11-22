group "Opción --eliminar USERNAME" do
  users = _eliminar
  peso = 20.0/users.size

  for name in users do
    target "script --eliminar #{name}", weight: peso
    run "#{_script} --eliminar #{name}", on: :host1
    run "#{_docker} id #{name}", on: :host1
    expect_one name
  end
end
