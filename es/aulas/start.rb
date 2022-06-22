
use "lib/software"
use "lib/home"

play do
  show
  export format: :html
  send copy_to: :host
end
