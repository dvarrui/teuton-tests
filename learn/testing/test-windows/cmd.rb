
group "Windows CMD over SSH" do

  target "Run whoami on #{gett(:host1_ip)}"
  goto   :host1, :exec => "whoami"
  expect get(:host1_username)

  target "Run ps on #{gett(:host1_ip)}"
  goto   :host1, :exec => "ps"
  expect "sshd"

end
