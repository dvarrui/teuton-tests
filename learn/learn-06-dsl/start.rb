
group "learn-06-dsl" do
  target "Create user #{username?}"
  run "id #{username?}"
  expect username?
end

play do
  show
  export
end
