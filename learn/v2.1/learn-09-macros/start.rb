use 'macro/gnulinux'

group "learn-09-macros" do
  call 'exist_user', name: 'root'
  call 'exist_user', name: 'fran'
  
  call_exist_user(name: 'david')
end

play do
  show
  export
end
