
use 'lib/opensuse'
use 'lib/linux'
use 'lib/disk_and_partitions'

start do
	show
	export format: :colored_text
  send copy_to: :host1
end
