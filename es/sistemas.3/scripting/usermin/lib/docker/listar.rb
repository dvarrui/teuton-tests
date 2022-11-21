group "Opción --listar" do
  cmd = _cmd.join(" ") + _script
  cmd.gsub!("FOLDER", _folder)
  cmd.gsub!("PWD", _pwd)

  run cmd + " --listar", on: :host1

  listar = _listar
  peso = 15.0/listar.size

  for line in listar do
    target "exec script --listar", weight: peso
    result.restore
    expect_one line
  end
end
