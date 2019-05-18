
group "Servidor Web" do
  target "Servicio activo"
  goto :host1, :exec => "systemctl status apache2"
  expect result.find("active (running)").count.equal(1), :weight => 5

  target "Existe fichero index.html"
  goto :host1, :exec => "vdir /srv/www/htdocs"
  expect result.find("index.html").count.equal(1), :weight => 5

  target "Nombre dentro de index.html"
  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  expect result.find(get(:username)).count.equal(1), :weight => 5

  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  unique "index_content", result.value
end
