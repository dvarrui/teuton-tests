
group :user_definitions do
  username = get(:username)

  target "User <#{username}> exists"
  run "cat /etc/passwd", on: :host1
  expect_one username

  target "Users <#{username}> with not empty password "
  run "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l", on: :host1
  expect result.eq(1)

  target "User <#{username}> logged"
  run "last | grep #{username[0,8]} | wc -l", on: :host1
  expect result.neq(0)
end
