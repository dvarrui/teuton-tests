define_macro 'user_exist', :name, :host do

  target "Comprobar que existe el usuario " + get(:name)
  run "cat /etc/passwd", on: get(:host)
  expect get(:name)

end
