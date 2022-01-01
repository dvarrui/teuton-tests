
group "Windows CMD over SSH" do
  
  target "Set 4GB of RAM memory for the virtual machine"
  puts "powershell -command (Get-WmiObject -Class Win32_ComputerSystem)"
  goto :host1, :exec => "powershell -command (Get-WmiObject -Class Win32_ComputerSystem)"
  expect result.find('TotalPhysicalMemory').near?(4294496256)

=begin
  target "Run whoami on #{gett(:host1_ip)}"
  puts "whoami"
  goto   :host1, :exec => "whoami" # CMD command
  expect get(:host1_username)

  target "Run ps on #{gett(:host1_ip)}"
  puts "ps"
  goto   :host1, :exec => "ps" # This isn't CMD command
  expect "sshd"
=end
end
