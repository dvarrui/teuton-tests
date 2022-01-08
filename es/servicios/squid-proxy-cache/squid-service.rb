
group "Instalación de Squid" do
  target "Servicio activo"
  run "systemctl status squid"
  expect "Active: active (running)"

  target "Servicio en el puerto 3128"
  run "lsof -i"
  expect ["squid", "*:3128"]
end

group "Configuración de Squid" do
  target "Squid port <3128>"
  run "cat /etc/squid/squid.conf"
  expect ["http_port ", "3128"]

  target "Configurar usuario <proxy>"
  run "cat /etc/squid/squid.conf"
  expect result.not_find('#').find("cache_effective_user ").find("proxy").count.eq(1)

  target "Configurar group <proxy>"
  run "cat /etc/squid/squid.conf"
  expect result.not_find('#').find("cache_effective_group ").find("proxy").count.eq(1)

  target "cache mem <100 MB>"
  run "cat /etc/squid/squid.conf"
  expect ["cache_mem ", " 100 MB"]

  target "cache dir 500 MB"
  run "cat /etc/squid/squid.conf"
  expect ["cache_dir ", " 500 "]

  target "access_log"
  run "cat /etc/squid/squid.conf"
  expect result.find("access_log ").find("daemon:/var/log/squid/access.log ").find("squid").count.eq(2)
end

group "Acceso del cliente Squid" do
  target "URL Web URL access"
  run "cat /var/log/squid/access.log"
  expect "www.nba.com"
end
