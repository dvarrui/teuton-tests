
group "learn-01-target" do
  target "Create user <david>"
  run "id david"
  result.debug
  expect "david"
  result.debug
end

play do
  show
  export
end
