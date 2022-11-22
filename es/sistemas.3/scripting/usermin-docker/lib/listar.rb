group "Opción --listar" do
  run _script + " --listar", on: :host1

  listar = _listar
  peso = 15.0/listar.size

  for line in listar do
    target "exec script --listar", weight: peso
    result.restore
    expect_one line
  end
end
