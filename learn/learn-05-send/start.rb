# encoding: utf-8

=begin
  Test several targets for every case into diferent hosts:
  * target : Describe the target
  * goto   : Move to localhost and execute the command
  * expect : Check if the result is equal to the expected value
  * get    : Get the value for every case from the configuration YAML file.
  * send   : copy report to temporal directory into the host used by the case
=end

group "Configure hostname and DNS server" do

  target "Hostname is <#{get(:host1_hostname)}>"
  goto   :host1, :exec => "hostname -f"
  expect_one get(:host1_hostname)

  target "DNS Server OK"
  goto   :host1, :exec => "host www.google.es"
  expect "has address"

end

group "Create user with your name" do

  target "Exist user <"+get(:username)+">"
  goto   :host1, :exec => "id #{get(:username)}"
  expect get(:username)

  goto   :host1, :exec => "blkid /dev/sda2"
  unique "UUID sda2", result.value

end

play do
  show
  export :format => :txt
  send :copy_to => :host1
end
