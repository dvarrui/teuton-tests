
group 'GNULinux user configuration' do

  username = get(:firstname)

  target "User <#{username}> exists"
  goto  :host1, :exec => "cat /etc/passwd"
  expect_one username

  target "Users <#{username}> with not empty password "
  goto  :host1, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2"
  expect result.count.eq(1)

  target "User <#{username}> logged"
  goto  :host1, :exec => "last"
  expect result.find(username[0,8]).count.neq(0)

end
