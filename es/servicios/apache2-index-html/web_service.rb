
group "Configuración del Servidor Web" do

  target "El servicio web apache2 debe estar en ejecución.", weight: 5
  run "systemctl status apache2", on: :host1
  expect "active (running)"

  target "Crear el fichero index.html", weight: 5
  run "vdir /srv/www/htdocs", on: :host1
  expect_one "index.html"

  target "Incluir el nombre de usuario #{gett(:username)} dentro de index.html", weight: 5
  run "cat /srv/www/htdocs/index.html", on: :host1
  expect get(:username)

  run "cat /srv/www/htdocs/index.html", on: :host1
  unique "index_content", result.value
end
