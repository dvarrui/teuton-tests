
group :user_definitions do
  username = get(:firstname)

  target "User <#{username}> exists"
  goto  :host1, :exec => "cat /etc/passwd"
  expect result.find(username).count.eq(1)

  target "Users <#{username}> with not empty password "
  goto  :host1, :exceute => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l"
  expect result.eq(1)

  target "User <#{username}> logged"
  goto  :host1, :exec => "last | grep #{username[0,8]} | wc -l"
  expect result.neq(0)
end
