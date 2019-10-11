macro :user, :name => 'david' do
  target "Create user #{get(:name)}"
  run "id #{get(:name)}"
  expect_one get(:name)
end
