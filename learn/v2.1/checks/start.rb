# use 'check/gnulinux/user'
use 'gnulinux/user'

group "learn-09-checks" do
  check 'exist_user', name: 'root'
  exist_user(name: 'fran')
  check_exist_user(name: 'david')
end

play do
  show
  export
end
