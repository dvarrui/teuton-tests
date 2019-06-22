
require_relative 'users'

play do
  show
  export
  send :copy_to => :host1, :prefix => 'a_problem_'
end
