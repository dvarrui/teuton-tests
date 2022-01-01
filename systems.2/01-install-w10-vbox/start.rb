
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

  target "Create user Alumno and make him member of Administradores local group"
  run "powershell -command (Get-LocalGroupMember Administradores).Name", on: :host1
  expect "IDP\\Alumno"

  target "Activate Windows 10"
  run 'cscript /Nologo "%windir%\System32\slmgr.vbs" /dlv', on: :host1
  expect "Estado de la licencia: con licencia"

  target "Set IDP as computer name"
  run "powershell -command $env:ComputerName", on: :host1
  expect "IDP"

  target "Set TimeZone to UTC+00:00 (Dublin, Edimburgh, Lisbon, London)"
  run "powershell -command (Get-TimeZone).Id", on: :host1
  expect "GMT Standard Time"

  target "Install Guest Additions on the virtual machine"
  run "powershell -command (Get-ItemProperty HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*).DisplayName", on: :host1
  expect "Oracle VM VirtualBox Guest Additions"

end

play do
  show
  export
end
