
require_relative 'network'

play do
  show
  export
  send :copy_to => :host1, :prefix => 'b_problem_'
end
