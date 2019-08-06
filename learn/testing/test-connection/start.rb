
=begin
This test just evaluate access to several diferent hosts, using SSH an telnet connections.
=end

use 'connection'

start do
  show
  export :format => :colored_text
end
