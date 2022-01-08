
use 'ssh'
use 'user'
use 'host'

start do
	show
	export :format => :colored_text
	send :copy_to => :host1
end
