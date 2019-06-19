
group "example 01" do
  target "Exist user <root>"
  run "id root"
  expect "root"

  target "Check root shell"
  run "cat /etc/passwd"
  expect ["root", "/bin/bash"]
end

play do
  show
  export
end
