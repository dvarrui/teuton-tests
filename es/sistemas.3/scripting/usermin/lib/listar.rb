group "Opción --listar" do
  # Execute "path/to/script --listar"
  run get(:script) + " --listar", on: :host1

  listar = get(:listar)
  peso = 15.0/listar.size

  listar.each do |line|
    target "exec script --listar", weight: peso
    result.restore
    expect_one line
  end
end
