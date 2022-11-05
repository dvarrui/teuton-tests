group "Opción --consultar USERNAME" do
  cmd = _cmd.join(" ") + _script
  cmd.gsub!("FOLDER", _folder)

  username = "obiwan2"
  run "#{cmd} --consultar #{username}", on: :host1

  consultar = _consultar
  peso = 15.0/consultar.size

  for items in consultar do
    label = items[0]
    value = items[1]

    target "consultar", weight: peso
    result.restore
    expect_one [label, value]
  end
end
