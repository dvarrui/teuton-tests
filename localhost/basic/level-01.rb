# encoding: utf-8

group "Target 01" do

  target "Create user <" + get(:username) + ">"
  run "id " + get(:username)
  expect result.count.equal?(1)

end

play do
  show
  export
end
