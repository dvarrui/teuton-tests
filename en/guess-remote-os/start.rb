
use 'guess-remote-os'

group 'Results' do
  log get(:ostype)
end

play do
  show
  export
end
