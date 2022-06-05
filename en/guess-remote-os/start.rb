
use 'guess-remote-os'

group 'Results' do
  log "OSTYPE = " + get(:ostype)
  log "DISTRO = " + get(:distro)
  log "MODEL  = " + get(:model)
end

play do
  show
  export
end
