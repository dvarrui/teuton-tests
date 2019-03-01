
group "Configuración de red" do
  target "Configuración DNS"
  goto :host1, :exec => "host www.iespuertodelacruz.es"
  expect result.find!("has").find!("address").count!.ge(1)

  target "Gateway OK"
  goto :host1, :exec => "ping 8.8.4.4 -c 4"
  expect result.find!("64 bytes from").find!("8.8.4.4").count!.ge(1)

  target "Hostname"
  goto :host1, :exec => "hostname"
  expect result.eq get(:hostname)
end
