
group "Ejemplos de prueba..." do

  target "Nombre de la máquina1 " + get(:host1_hostname)
  run "hostname", on: :host1
  expect get(:host1_hostname)

  target "Nombre de la máquina2 " + get(:host2_hostname)
  # echo y | plink idp@2.tcp.eu.ngrok.io -ssh -P 16256 -pw idp "echo > Desktop\hola.txt"
  run "hostname", on: :host2
  expect get(:host2_hostname)
end

play do
  show
  export
  send :copy_to => :host1
end
