
require_relative 'config_red'
require_relative 'servidor_web'

play do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
