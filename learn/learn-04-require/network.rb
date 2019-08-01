
group "Network configuracion" do

  target "Hostname is #{gett(:host1_hostname)}"
  goto   :host1, :exec => "hostname"
  expect_one get(:host1_hostname)

  target "DNS Server OK"
  goto   :host1, :exec => "nslookup www.google.es"
  expect "Nombre:"

end
