
use 'network'
use 'web_service'

play do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
