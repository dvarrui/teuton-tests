
group "Configuración de red" do
  target "Configuración DNS"
  goto :host1, :exec => "host www.iespuertodelacruz.es"
  expect ["has", "address"]

  target "Gateway OK"
  goto :host1, :exec => "ping 8.8.4.4 -c 4"
  expect ["64 bytes from", "8.8.4.4"]

  target "Hostname"
  goto :host1, :exec => "hostname"
  expect get(:hostname)
end

group "Servidor Web" do
  target "Servicio activo", :weight => 5
  goto :host1, :exec => "systemctl status apache2"
  expect "active (running)"

  target "Existe fichero index.html", :weight => 5
  goto :host1, :exec => "vdir /srv/www/htdocs"
  expect_one "index.html"

  target "Nombre dentro de index.html", :weight => 5
  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  expect get(:username)

  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  unique "index_content", result.value
end

play do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
