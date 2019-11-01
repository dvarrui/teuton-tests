
group "learn-06-readme" do
  target "Create user <david>"
  run "id david"
  expect "david"
end

play do
  show
  export
end
