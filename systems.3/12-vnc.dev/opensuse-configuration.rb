
group "OpenSUSE Host Configuration" do
  # Unique OpenSUSE MAC
  goto :opensuse, :exec => "ifconfig| grep HWaddr| tr -s ' ' '%'| cut -d % -f 5"
  unique "MAC[host2]", result.value

  target "Set hostname to " + gett(:opensuse_hostname)
  goto :opensuse, :exec => "hostname -a"
  expect result.equal(get(:opensuse_hostname))

  target "Set domainname to " + gett(:domain)
  goto :opensuse, :exec => "hostname -d"
  expect result.equal(get(:domain))

  target "Create user " + gett(:firstname)
  goto :opensuse, :exec => "cat /etc/passwd"
  expect_one get(:firstname)
end
