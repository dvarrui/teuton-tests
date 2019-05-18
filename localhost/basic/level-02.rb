# encoding: utf-8

group "Target 02" do

  target "Create user <"+get(:username)+">", :weight => 2.0
  run "id #{get(:username)}"
  expect result.count.equal?(1)

  target "Member of group <"+get(:groupname)+">"
  run "id #{get(:username)}"
  expect result.find(get(:groupname)).count.equal?(1)

end

play do
#  show
  export
end
