use 'user'

group "learn-09-macros" do
  call 'exist_user', name: 'root'
  call 'exist_user', name: 'david'
  call 'exist_user', name: 'fran'
end

play do
  show
  export
end
