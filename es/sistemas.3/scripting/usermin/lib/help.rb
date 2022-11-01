group "Opción --help" do
  target "exec script --help", weight: 10
  run get(:cmd) + " --help"
  expect "Show help"
end
