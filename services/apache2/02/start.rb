
require_relative 'config_red'
require_relative 'servidor_web'

start do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
