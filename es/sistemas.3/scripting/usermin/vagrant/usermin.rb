#!/usr/bin/env ruby

option = ARGV[0]

def show_help
  puts "Show help"
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

case option
when "--help"
  show_help
when "--listar"
  show_users
when "--consultar"
  show_user(ARGV[1])
else
  exit 1
end

exit 0
