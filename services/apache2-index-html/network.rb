
group "Configuración de red" do

  target "Configuración del servidor DNS funcionando correctamente."
  run "host www.iespuertodelacruz.es", on: :host1
  expect ["has", "address"]

  target "Gateway funcionando correctamente."
  run "ping 8.8.4.4 -c 4", on: :host1
  expect ["64 bytes from", "8.8.4.4"]

  target "Modificar hostname con #{gett(:hostname)}"
  run "hostname", on: :host1
  expect get(:hostname)

end
