
group "Configure hostname and DNS server" do

  target "Hostname is <#{get(:host1_hostname)}>"
  goto   :host1, :exec => "hostname -f"
  expect_one get(:host1_hostname)

  target "DNS Server OK"
  goto   :host1, :exec => "host www.google.es"
  expect "has address"

end

group "Create user with your name" do

  target "Exist user <#{get(:username)}>"
  goto   :host1, :exec => "id #{get(:username)}"
  expect get(:username)

end

play do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
