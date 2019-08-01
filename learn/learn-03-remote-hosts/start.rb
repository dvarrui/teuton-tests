
group "learn 03 remote hosts" do

  target "Hostname is #{gett(:host1_hostname)}"
  goto   :host1, :exec => "hostname"
  expect_one get(:host1_hostname)

  target "DNS Server OK"
  goto   :host1, :exec => "nslookup www.google.es"
  expect "Nombre:"

  target "Exist user #{gett(:username)}"
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
