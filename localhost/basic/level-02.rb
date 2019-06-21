
group "Level 02" do

  target "Create user <#{get(:username)}>", :weight => 2.0
  run "id #{get(:username)}"
  expect get(:username)

  target "Member of group <#{get(:groupname)}>"
  run "id #{get(:username)}"
  expect get(:groupname)

end

play do
#  show
  export
end
