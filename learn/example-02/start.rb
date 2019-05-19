
=begin
  Test if exist username for every case into localhost:
  * target : Describe the target
  * goto   : Move to localhost and execute the command
  * expect : Check if the result is equal to the expected value
  * get    : Get the value for every case from the configuration YAML file.

  Checking localhost with GNU/Linux OS.
=end

group "User with your name" do

  target "Checking user <#{get(:username)}> using commands"
  run "id #{get(:username)}| wc -l"
  expect '1'

  target "Checking user <#{get(:username)}> using id command"
  run "id #{get(:username)}"
  expect get(:username)

  target "Checking user <#{get(:username)}> using cat command"
  run "cat /etc/passwd"
  expect get(:username)

end

play do
  show
  # export using other output formats
  export :format => :colored_text
end
