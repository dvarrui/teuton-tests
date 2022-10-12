
use 'guess-remote-os'

group 'Guess Remote/Local OS' do
  log "OSTYPE = " + get(:ostype)
  log "DISTRO = " + get(:distro)
  log "MODEL  = " + get(:model)
end

play do
  show
  export
end
