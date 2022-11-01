#!/usr/bin/env ruby

option = ARGV[0]

def show_help
  puts "Show help"
end

case option
when "--help"
  show_help
else
  exit 1
end

exit 0
