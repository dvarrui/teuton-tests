
=begin
  Test several targets for every case into diferent hosts:
  * target : Describe the target
  * goto   : Move to localhost and execute the command
  * expect : Check if the result is equal to the expected value
  * get    : Get the value for every case from the configuration YAML file.

  Checking machine (host1) with GNU/Linux OS.
=end

task "Configure hostname and DNS server" do

  target "Hostname is <"+get(:host1_hostname)+">"
  goto   :host1, :exec => "hostname -f"
  expect get(:host1_hostname)

  target "DNS Server OK"
  goto   :host1, :exec => "host www.google.es"
  expect "has address"

end

group "User with your name" do

  target "Exist user <"+get(:username)+">"
  goto   :host1, :exec => "id #{get(:username)}"
  expect get(:username)

end

start do
  show
  export
end
