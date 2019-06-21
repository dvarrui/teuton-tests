
require_relative 'network'
require_relative 'web_service'

play do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
