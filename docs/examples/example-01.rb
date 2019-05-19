
=begin
  Test if exist user into localhost using several ways
  * target : Describe the target
  * goto   : Move to localhost, and execute the command
  * expect : Check if the results are equal to expected value

  Checking localhost with GNU/Linux OS.
=end

group "Verify users by several ways" do

  target "Way 1: Checking user <root> using commands"
  run "id root| wc -l"
  expect '1'

  target "Way 2: Checking user <root> using count method"
  run "id root"
  expect "root"
  # It's the same as: expect result.find("root").count.eq 1

  target "Way 3: Checking user <root> using find and count methods with String arg"
  run "cat /etc/passwd"
  expect ["root", "0", "/bin/bash"]

  target "Way 4: Checking user <obiwan, obi-wan> using find and count methods with Regexp arg"
  run "cat /etc/passwd"
  expect /Root|root/
  # The same as: expect result.find(/obiwan|obi-wan/).count.eq 1
end

play do
  show
  export
end
