
group "Group configuration" do

  target "Exist group <#{get(:groupname)}>"
  run "cat /etc/group"
  expect_one get(:groupname)

  target "Member of group <#{get(:groupname)}>"
  run "id #{get(:username)}"
  expect_one get(:groupname)

end
