# use "lib/vm/help"
# use "lib/vm/listar"
# use "lib/vm/consultar"

use "lib/docker/help"
use "lib/docker/nuevo"
use "lib/docker/listar"
use "lib/docker/consultar"
use "lib/docker/eliminar"

play do
  show
  export format: :colored_text
end
