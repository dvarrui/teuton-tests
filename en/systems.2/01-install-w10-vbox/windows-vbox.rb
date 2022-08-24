
group "Install Windows 10 on a VBox virtual machine" do

  target "Set 4GB of RAM memory for the virtual machine"
  run "powershell -command (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory -eq 4294496256", on: :host1
  expect "True"

  target "Set a 25GB hard disk drive for the virtual machine"
  run "powershell -command (get-disk -Number 0).Size/1gb -eq 25", on: :host1
  expect "True"

  target "Install Windows 10 Pro on the virtual machine"
  run "powershell -command (Get-CimInstance Win32_Operatingsystem).Caption", on: :host1
  expect "Microsoft Windows 10 Pro"

end

