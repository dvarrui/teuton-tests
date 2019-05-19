
=begin
  Test if exist user into localhost
  * target : Describe the target
  * run    : Execute command into localhost
  * expect : Check if the results with expected value

  Checking localhost with GNU/Linux OS.
=end

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
