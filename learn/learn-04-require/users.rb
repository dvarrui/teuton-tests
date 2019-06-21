
group "User configuration" do

  target "Exist user <#{get(:username)}>"
  goto   :host1, :exec => "net user"
  expect get(:username)

end
