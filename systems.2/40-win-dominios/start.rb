
=begin
Spanish URL:
* https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/idp/dominios/pdc-winserver.md
=end

use 'winserver-config'
use 'winclients-config'
#use 'winserver-active-directory'

start do
  show
  #export :format => :colored_text
  export
end
