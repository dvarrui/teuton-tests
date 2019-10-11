macro :user, :username => 'david' do
  target 'Create user david'
  run 'id david'
  expect_one 'david'
end

group "learn-09-macros" do
  call :user
end

play do
  show
  export
end
