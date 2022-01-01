
group "Level 01" do

  target "Create user <root>"
  run "id root"
  expect "root"

end

play do
  show
  export
end
