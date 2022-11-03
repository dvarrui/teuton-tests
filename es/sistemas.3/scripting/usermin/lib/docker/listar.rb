group "Opción --listar" do
  cmd = get(:cmd).join(" ") + get(:script)
  run cmd + " --listar", on: :host1

  listar = get(:listar)
  peso = 15.0/listar.size

  listar.each do |line|
    target "exec script --listar", weight: peso
    result.restore
    expect_one line
  end
end
