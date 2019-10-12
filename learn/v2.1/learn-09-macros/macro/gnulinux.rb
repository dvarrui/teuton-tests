macro 'exist_user', :name do
  target "Create user #{get(:name)}"
  run "id #{get(:name)}"
  expect_one get(:name)
end
