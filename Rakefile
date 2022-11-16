# File: Rakefile
# Usage: rake

require 'fileutils'

desc 'Default => help'
task default: :help do
end

desc 'Update project'
task :update do
  repo = 'teuton-challenges'
  puts "[INFO] Pulling <#{repo}> repo..."
  system('git pull')
end

desc 'Delete output files'
task :clean do
  system("rm -r #{File.join('var', '*')}")
end

desc 'Show help'
task :help do
  system('rake -T')
end
