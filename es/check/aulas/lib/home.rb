
group "Verificar HOMES" do
  folders = [ 'asir', 'daw', 'super' ]

  for name in folders do
    target "Existe directorio /home/#{name}"
    run "vdir /home", on: :host
    expect [ 'drwx', name ]

    target "Permisos fichero #{name}.tar"
    run "vdir /home/#{name}.tar", on: :host
    expect "-rw-r--r--"
  end
end
