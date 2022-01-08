
group 'User configuration' do
  username=get(:firstname)

  target "Create user #{username}."
  goto  :host1, :exec => "id #{username}"
  expect_one username

  target "Set password to user #{username}."
  goto  :host1, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2"
  expect result.count.eq(1)

  target "Open session with user #{username}."
  goto  :host1, :exec => "last"
  expect username[0,8]
end
