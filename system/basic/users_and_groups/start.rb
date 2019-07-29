
require_relative 'host'
require_relative 'users'
require_relative 'folders'

start do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
