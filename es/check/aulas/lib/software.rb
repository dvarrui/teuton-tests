group "software" do
  target "plasma-desktop instalado"
  run "apt info plasma-desktop", on: :host
  expect "Installed-Size:"
end
