#!/usr/bin/env ruby

option = ARGV[0]

def show_help
  puts "Modo de uso"
  puts "  --help       Mostrar la ayuda del comando"
  puts "  --listar     Listar todos los usuarios desde el UID 1000 en adelante"
  puts "  --consultar  Mostrar la ficha de un usuario concreto"
  puts "  --nuevo      Crear un nuevo usuario"
  puts "  --eliminar   Eliminar un usuario existente"
  puts "  -f fichero   Crear usuarios por lotes desde un fichero"
end

def show_users
  lines = File.read("/etc/passwd").split("\n")
  users = []
  lines.each do |line|
    items = line.split(":")
    next if items[2].to_i < 1000
    user = [items[0], items[2], items[6], items[4]]
    users << user.join(",")
  end
  puts users
end

def show_user(username)
  lines = File.read("/etc/passwd").split("\n")
  users = []
  lines.each do |line|
    items = line.split(":")
    if items[0] == username
      puts "Usuario: #{items[0]}"
      puts "UID: #{items[2]}"
      puts "GID: #{items[3]}"
      puts "Shell: #{items[6]}"
      puts "HOME: #{items[5]}"
      return
    end
  end
end

def create_user(username: , comment:, shell:, password:)
  # useradd vader1 -c "sith" -s /bin/bash -p 123456
  system("useradd #{username} -c #{comment} -s #{shell} -p #{password}")
  # system("id #{username}")
end

def delete_user(username)
  system("userdel #{username} -c #{comment} -s #{shell} -p #{password}")
end

case option
when "--help"
  show_help
when "--listar"
  show_users
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
