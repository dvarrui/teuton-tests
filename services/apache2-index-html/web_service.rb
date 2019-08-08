
group "Configuración del Servidor Web" do
  target "El servicio web apache2 debe estar en ejecución.", :weight => 5
  goto :host1, :exec => "systemctl status apache2"
  expect "active (running)"

  target "Crear el fichero index.html", :weight => 5
  goto :host1, :exec => "vdir /srv/www/htdocs"
  expect_one "index.html"

  target "Incluir el nombre de usuario #{gett(:username)} dentro de index.html", :weight => 5
  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  expect get(:username)

  goto :host1, :exec => "cat /srv/www/htdocs/index.html"
  unique "index_content", result.value
end
