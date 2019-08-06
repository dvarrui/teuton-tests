
use 'opensuse'

play do
  show
  export :format => :colored_text
  send :copy_to => :host1
end
