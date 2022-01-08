
group "Create users" do
  users = [1,2,3]

  users.each do |i|
    username= "#{get(:lastname1)}#{i}"

    target "Create user #{username}"
	  goto :host1, :exec => "cat /etc/passwd"
    expect_one username

	  target "Set password to user #{username}"
	  goto :host1, :exec => "cat /etc/shadow | grep #{username}| cut -d : -f 2| wc -l"
	  expect result.equal(1)

	  target "Open session with user #{username}"
	  goto :host1, :exec => "last"
    expect username[0,8]
  end
end
