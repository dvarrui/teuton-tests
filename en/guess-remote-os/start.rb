
use 'gnulinux'
use 'windows'

group 'Results' do
  log get(:ostype)
end

play do
  show
  export
end
