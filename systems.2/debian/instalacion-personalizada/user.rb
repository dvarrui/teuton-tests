
group 'GNULinux user configuration' do

  set(:username, get(:firstname))

  target "Create user #{gett(:username)}"
  goto  :host1, :exec => "cat /etc/passwd"
  expect_one get(:username)

  target "User #{gett(:username)} need a no empty password"
  goto  :host1, :exec => "cat /etc/shadow | grep '#{get(:username)}:' | cut -d : -f 2"
  expect result.count.eq(1)

  target "Log into using #{gett(:username)} user"
  goto  :host1, :exec => "last"
  expect result.find(get(:username)[0,8]).count.neq(0)

end
