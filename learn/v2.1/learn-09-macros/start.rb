macro :user, :name => 'david' do
  target "Create user #{get(:name)}"
  run "id #{get(:name)}"
  expect_one get(:name)
end

group "learn-09-macros" do
  call :user, :name => 'root'
  call :user, :name => 'david'
  call :user, :name => 'fran'
end

play do
  show
  export
end
