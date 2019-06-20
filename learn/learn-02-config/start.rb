
group "learn 02 config" do

  target "Checking user <#{get(:username)}>"
  run "id #{get(:username)}"
  expect get(:username)

end

play do
  show
  export
end
