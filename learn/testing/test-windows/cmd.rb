
group "Windows CMD over SSH" do

  target "Run whoami on #{gett(:host1_ip)}"
  puts "whoami"
  goto   :host1, :exec => "whoami"
  expect get(:host1_username)

  target "Set 4GB of RAM memory for the virtual machine"
  puts "powershell -command (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory -eq 4294496256"
  goto :host1, :exec => "powershell -command (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory -eq 4294496256"
  expect "True"

  target "Run ps on #{gett(:host1_ip)}"
  puts "ps"
  goto   :host1, :exec => "ps"
  expect "sshd"

end
