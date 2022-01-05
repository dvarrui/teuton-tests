
group "Always true" do

  target "Don't do nothing. This is always true."
  goto :localhost, :exec => 'whoami'
  expect_none 'Darth Sidious'

end

play do
  show
  export
end
