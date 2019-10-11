use 'user'

group "learn-09-macros" do
  call :user, :name => 'root'
  call :user, :name => 'david'
  call :user, :name => 'fran'
end

play do
  show
  export
end
