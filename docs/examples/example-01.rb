
=begin
  Test if exist user <obiwan> into localhost using several ways
  * target : Describe the target
  * goto   : Move to localhost, and execute the command
  * expect : Check if the results are equal to expected value

  Teacher host (localhost) must have GNU/Linux OS.
=end

group "Test users by several ways" do

  target "Way 1: Checking user <root> using commands"
  goto :localhost, :exec => "id root| wc -l"
  expect result.equal('1')

  target "Way 2: Checking user <root> using count method"
  goto :localhost, :exec => "id root"
  expect result.count.eq 1

  target "Way 3: Checking user <root> using find and count methods with String arg"
  goto :localhost, :exec => "cat /etc/passwd"
  expect "root"
  # It's the same as: expect result.find("root").count.eq 1

  target "Way 4: Checking user <obiwan, obi-wan> using find and count methods with Regexp arg"
  goto :localhost, :exec => "cat /etc/passwd"
  expect /obiwan|obi-wan/
  # The same as: expect result.find(/obiwan|obi-wan/).count.eq 1
end

play do
  show
  export
end
