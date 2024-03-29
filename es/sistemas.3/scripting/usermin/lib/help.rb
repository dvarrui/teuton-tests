group "Opción --help" do
  cmd = get(:script)

  run cmd + " --help", on: :host1

  options = ["--help", "--listar", "--consultar", "--nuevo", "--eliminar", "-f fichero"]
  peso = 10.0/options.size

  options.each do |option|
    target "exec script --help", weight: peso
    result.restore
    expect option
  end
end
