group "Opción --help" do
  cmd = get(:cmd).join(" ")
  target "exec script --help", weight: 10
  run cmd + " --help", on: :host1
  expect "Show help"
end
