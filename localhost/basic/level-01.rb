# encoding: utf-8

group "Target 01" do

  target "Create user <" + get(:username) + ">"
  run "id #{get(:username)}"
  expect get(:username)

end

play do
  show
  export
end
