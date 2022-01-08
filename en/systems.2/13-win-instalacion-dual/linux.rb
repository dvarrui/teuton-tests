
group "Settings" do
  set(:linux1_ip, get(:opensuse1_ip))
  set(:linux1_username, get(:opensuse1_username))
  set(:linux1_password, get(:opensuse1_password))
  set(:linux1_hostname, get(:opensuse1_hostname))
end

group 'Check GNU/Linux network configuration' do
  target "Gateway configuration working"
  goto  :linux1, :exec => "ping 8.8.4.4 -c 1"
  expect_one "64 bytes from 8.8.4.4"

  target "DNS configuration working"
  goto  :linux1, :exec => "host www.nba.com"
  expect "has address"
end

group 'GNULinux user definitions' do
  username = get(:firstname)

  target "User #{username} exists"
  goto  :linux1, :exec => "cat /etc/passwd"
  expect_one username

  target "User #{username} with not empty password "
  goto  :linux1, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2"
  expect result.count!.eq(1)

  target "User #{username} logged"
  goto  :linux1, :exec => "last"
  expect username[0,8]
end
