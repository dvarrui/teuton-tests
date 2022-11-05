group "Opción --listar" do
  cmd = get(:cmd).join(" ") + get(:script)
  cmd.gsub!("FOLDER", get(:folder))
  run cmd + " --listar", on: :host1

  listar = get(:listar)
  peso = 15.0/listar.size

  for line in listar do
    target "exec script --listar", weight: peso
    result.restore
    expect_one line
  end
end
