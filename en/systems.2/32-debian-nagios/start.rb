
# Course name : IDP1516
#    Activity : Nagios Debian Windows (Trimestre2)
#       MV OS : debian1 => Debian8
#             : debian2 => Debian8
#             : windows1 => Windows7
#  Teacher OS : GNU/Linux
# English URL : (Under construction. Sorry!)
# Spanish URL : https://github.com/dvarrui/libro-de-actividades/blob/master/actividades/sistamas.2/monitorizar/nagios-debian-windows.md

use 'register_information'
use 'debian1/config-mv'
use 'debian1/nagios-server'
use 'debian2/config-mv'
use 'debian2/agent'
use 'windows1/config-mv'
use 'windows1/agent'
use 'debian1/monit'

start do
  show
  export format: :colored_text
  send copy_to: :debian1
end
