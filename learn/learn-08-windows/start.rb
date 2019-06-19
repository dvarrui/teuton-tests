# encoding: utf-8

group "Windows: external configuration" do

  target "Localhost: Conection with <#{get(:windows1_ip)}>"
  run "ping #{get(:windows1_ip)}"
  expect_none "Destination Host Unreachable"

  target "Localhost: netbios-ssn service on #{get(:windows1_ip)}"
  run "nmap -Pn #{get(:windows1_ip)}"
  expect "139/tcp", "open"

end

group "Windows: internal configurations" do

  target "Windows version"
  goto   :windows1, :exec => "ver"
  expect "Windows", "6.1"

  target "Windows COMPUTERNAME"
  goto   :windows1, :exec => "set"
  expect "COMPUTERNAME", get(:windows1_hostname)

  target "Windows router Config<#{get(:gateway)}>"
  goto   :windows1, :exec => "ipconfig"
  expect "enlace", get(:gateway)

  target "Windows router OK"
  goto   :windows1, :exec => "ping #{get(:dns)}"
  expect result.find("Respuesta").count.eq 4

  target "Windows DNS OK"
  goto   :windows1, :exec => "nslookup www.iespuertodelacruz.es"
  expect "Address:", "88.198.18.148"
end

=begin
task "Ping from windows1 to *" do
  target "ping windows1 to debian1_ip"
  goto :windows1, :exec => "ping #{get(:debian1_ip)}"
  expect result.find("Respuesta").count.gt 1

  target "ping windows1 to debian1_name"
  goto :windows1, :exec => "ping #{@short_hostname[1]}"
  expect result.find("Respuesta").count.gt 1

  target "ping windows1 to debian2_ip"
  goto :windows1, :exec => "ping #{get(:debian2_ip)}"
  expect result.find("Respuesta").count.gt 1

  target "ping windows1 to debian2_name"
  goto :windows1, :exec => "ping #{@short_hostname[2]}"
  expect result.find("Respuesta").count.gt 1

end
=end

play do
  show
  export :format => :colored_text
end
