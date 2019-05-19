
group "Create user obiwan" do

  target "Checking user <obiwan>"
  run "id obiwan"
  expect "obiwan"

end
