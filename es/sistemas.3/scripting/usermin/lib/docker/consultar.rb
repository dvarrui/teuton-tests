group "Opción --consultar USERNAME" do
  cmd = get(:cmd).join(" ")
  run "#{cmd} --consultar root", on: :host1

  consultar = get(:consultar)
  peso = 15.0/consultar.size

  consultar.each do |items|
    label = items[0]
    value = items[1]

    target "consultar", weight: peso
    result.restore
    expect_one [label, value]
  end
end
