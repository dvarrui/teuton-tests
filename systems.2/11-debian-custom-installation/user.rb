
group 'GNU/Linux user configuration' do

  target "Create user #{gett(:username)}"
  run "cat /etc/passwd", on: :host1
  expect_one get(:username)

  target "User #{gett(:username)} need a no empty password"
  run "cat /etc/shadow | grep '#{get(:username)}:' | cut -d : -f 2", on: :host1
  expect result.count.eq(1)

  target "Log into using #{gett(:username)} user"
  run "last", on: :host1
  expect result.find(get(:username)[0,8]).count.neq(0)
end
