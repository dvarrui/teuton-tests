
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
