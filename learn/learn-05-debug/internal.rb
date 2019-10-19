
group "Windows: internal configurations" do

  target "Windows version"
  goto   :windows1, :exec => "ver"
  expect "Windows", "6.1"

  target "Windows COMPUTERNAME"
  goto   :windows1, :exec => "set"
  expect "COMPUTERNAME", get(:windows1_hostname)

  target "Windows router #{gett(:gateway)}"
  goto   :windows1, :exec => "ipconfig"
  expect "enlace", get(:gateway)

  target "Windows router OK"
  goto   :windows1, :exec => "ping #{get(:dns)}"
  expect result.find("Respuesta").count.eq 4

  target "Windows DNS OK"
  goto   :windows1, :exec => "nslookup www.iespuertodelacruz.es"
  expect "Address:", "88.198.18.148"
end
