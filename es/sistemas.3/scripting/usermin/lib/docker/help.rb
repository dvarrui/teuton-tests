group "Opción --help" do
  cmd = get(:cmd).join(" ") + get(:script)
  cmd.gsub!("FOLDER", get(:folder))

  run cmd + " --help", on: :host1

  options = ["--help", "--listar", "--consultar", "--nuevo", "--eliminar", "-f fichero"]
  peso = 10.0/options.size

  for option in options do
    target "exec script --help", weight: peso
    result.restore
    expect option
  end
end
