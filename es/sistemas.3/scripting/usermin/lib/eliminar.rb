group "Opción --eliminar USERNAME" do
  script = _script
  users = _eliminar
  peso = 20.0/users.size

  users.each do |name|
    target "script --eliminar #{name}", weight: peso
    run "#{script} --eliminar #{name}", on: :host1
    run "id #{name}", on: :host1
    expect_one name
  end
end
