
group "Configure hostname and DNS server" do

  target "Hostname is <#{get(:host1_hostname)}>"
  goto   :host1, :exec => "hostname"
  expect_one get(:host1_hostname)

  target "DNS Server OK"
  goto   :host1, :exec => "nslookup www.google.es"
  expect "Nombre:"

end

group "Create user with your name" do

  target "Exist user <#{get(:username)}>"
  goto   :host1, :exec => "net user"
  expect get(:username)

end

play do
  show
  # export using other output formats
  export :format => :colored_text
  export :format => :json
  send :copy_to => :host1
end
