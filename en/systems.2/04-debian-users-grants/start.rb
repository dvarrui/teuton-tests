
use 'host'
use 'users'
use 'folders'

start do
  show
  export format: :colored_text
  send copy_to: :host1
end
