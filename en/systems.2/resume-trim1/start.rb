
=begin
Spanish Exercise URL:
* https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/global/configuracion/windows.md
* https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/global/configuracion/opensuse.md
=end

require_relative 'windows'
require_relative 'test-windows'
require_relative 'opensuse'
require_relative 'test-opensuse'

start do
  show
  export :format => :colored_text
  send :copy_to => :host2
end
