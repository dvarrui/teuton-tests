
group "Level 03" do

  username = "david"
  groupname = "users"

  target "Create user <#{username}>"
  run "id #{username}"
  expect username

  target "Member of group <#{groupname}>"
  result.restore!
  expect groupname

  home = "/home/" + username

  target "User home is <#{home}>"
  run "cat /etc/passwd"
  expect [ home, username ]
end

play do
  show
  export
end
