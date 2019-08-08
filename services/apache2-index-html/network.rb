
group "Configuración de red" do

  target "Configuración del servidor DNS funcionando correctamente."
  goto :host1, :exec => "host www.iespuertodelacruz.es"
  expect ["has", "address"]

  target "Gateway funcionando correctamente."
  goto :host1, :exec => "ping 8.8.4.4 -c 4"
  expect ["64 bytes from", "8.8.4.4"]

  target "Modificar hostname con #{gett(:hostname)}"
  goto :host1, :exec => "hostname"
  expect get(:hostname)
  
end
