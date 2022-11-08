#!/usr/bin/env ruby

option = ARGV[0]

def show_help
  puts "Modo de uso"
  puts "  --help      Ayuda del script"
  puts "  --usuarios  Crear HTML de usuarios"
  puts "  --discos"
  puts "  --completo"
  puts "  --detallado"
  puts "  Sin opcione"
end

def show_users(option)
  detallado = true if option == "--detallado"
  lines = File.read("/etc/passwd").split("\n")
  users = []
  lines.each do |line|
    # nombre, UID y GID. --detallado,Shell y el HOME
    items = line.split(":")
    user = [items[0], items[2], items[3]]
    user += [items[5], items[6]] if detallado
    users << "<tr><td>#{user.join("</td><td>")}</td></tr>"
  end

  puts cabecera_html
  puts users.join("\n")
end

def cabecera_html
  text = <<-HEAD
<html>
  <head><title>Informin</title></head>
  <body>
    <h2>Informe sobre usuarios </h2>
    <table>
      <tr><th>Nombre</th><th>UID</th><th>GID</th></tr>
HEAD
  puts text
end

case option
when "--help"
  show_help
when "--usuarios"
  show_users(ARGV[1])
when "--consultar"
  show_user(ARGV[1])
when "--nuevo"
  create_user(
    username: ARGV[1],
    comment: ARGV[2],
    shell: ARGV[3],
    password: ARGV[4]
  )
when "--eliminar"
  delete_user(ARGV[1])
else
  exit 1
end

exit 0
