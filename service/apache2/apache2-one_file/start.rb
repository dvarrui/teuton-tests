
group "Configuración de red" do
  target "Configuración DNS"
  goto :host1, :exec => "host www.iespuertodelacruz.es"
  expect result.find("has").find("address").count.ge(1)

  target "Gateway OK"
  goto :host1, :exec => "ping 8.8.4.4 -c 4"
  expect result.find("64 bytes from").find("8.8.4.4").count.ge(1)

  target "Hostname"
  goto :host1, :exec => "hostname"
  expect result.eq get(:hostname)
end

group "Servidor Web" do
  target "Servicio activo", :weight => 5
  goto :host1, :exec => "systemctl status apache2"
  expect result.find("active (running)").count.equal(1)

  target "Existe fichero index.html", :weight => 5
  goto :host1, :exec => "vdir /srv/www/htdocs"
  expect result.find("index.html").count.equal(1)

  target "Nombre dentro de index.html", :weight => 5
  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  expect result.find!(get(:username)).count.equal(1)

  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  unique "index_content", result.value
end

play do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
