# File: Rakefile
# Usage: rake

require 'fileutils'

desc 'Default'
task default: :update do
end

desc 'Update project'
task :update do
  puts "[INFO] Pulling <teuton-challenges> repo..."
  system('git pull')
end

desc 'Delete output files'
task :clean do
  system("rm -r var/*")
end
