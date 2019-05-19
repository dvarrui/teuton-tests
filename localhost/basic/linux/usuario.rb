
group "Target: Usuario" do

  target "Create user <"+get(:username)+">"
  run "id #{get(:username)}"
  expect get(:username)

  home = "/home/#{get(:username)}"

  target "User home is <#{home}>"
  run "cat /etc/passwd"
  expect_one [home, get(:username)]
end
