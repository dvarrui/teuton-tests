
group "Network configuration" do

  target "Máquina A <#{get(:maquinaA_ip)}/24>"
  goto :maquinaA, :exec => "ip a"
  expect [ "inet", "#{get(:maquinaA_ip)}/24" ]

  target "Máquina B <#{get(:maquinaB_ip)}/24>"
  goto :maquinaB, :exec => "ip a"
  expect [ "inet", "#{get(:maquinaB_ip)}/24" ]

end
