
require_relative 'host-config'
require_relative 'squid-service'

# play ONLY on localhost

play do
  show
  export :format => :colored_text
end
