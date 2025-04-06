group "Revisar el contenido del proyecto GNS3" do

  # Crear nuevos parámetros a partir de <project_path> durante la ejecución
  items = get(:project_path).split('/')
  project_file = items.delete_at(-1)
  project_dir = items.join('/')

  set(:project_file, project_file)
  set(:project_dir, project_dir)

  # Seguir evaluando los targets
  target "Crear el proyecto GNS3 <#{get(:project_path)}>"
  run "ls #{get(:project_dir)}", on: :host
  expect get(:project_file)

  # Se crea un iterador para las acciones repetidas
  node_names = ['PC1', 'PC2', 'Switch1']

  for node_name in node_names do
    target "Crear el nodo <#{node_name}>"
    run "jq '.topology.nodes[].name' #{get(:project_path)}", on: :host
    expect node_name,  
  end

end

group "Localizar la consola de cada dispositivo y guardar su valor" do

  # Se crea un iterador para las acciones repetidas
  node_names = ['PC1', 'PC2']

  for node_name in node_names do
    cmd = "jq '.topology.nodes[] | select (.name == \"#{node_name}\") | .console' #{get(:project_path)}"
    run cmd, on: :host
    set("#{node_name.downcase}_console".to_sym, result.value)  
  end

end
