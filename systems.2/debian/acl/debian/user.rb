
group 'GNULinux user definitions' do

  username=get(:firstname)

  target "Create use #{username}"
  goto  :host1, :exec => "cat /etc/passwd"
  expect_one username

  target "User <#{username}> with not empty password "
  goto  :host1, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2"
  expect result.count!.eq(1)

  target "Open a session with user #{username}"
  goto  :host1, :exec => "last"
  expect username[0,8] 
end
