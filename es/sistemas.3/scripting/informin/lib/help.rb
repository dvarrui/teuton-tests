group "Opción --help" do
  script = _script

  run script + " --help", on: :host1

  options = ["--help", "--usuarios", "--discos", "--completo", "--detallado"]
  peso = 10.0/options.size

  options.each do |option|
    target "#{script} --help", weight: peso
    result.restore
    expect option
  end
end
