group "Opción --help" do
  target "exec script --help", weight: 10
  run get(:cmd) + " --help", on: :host1
  expect "Show help"
end
