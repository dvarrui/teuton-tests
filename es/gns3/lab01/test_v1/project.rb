group "Revisar el contenido del proyecto GNS3" do

  target "Crear el proyecto GNS3 <#{get(:project_path)}>"
  run "ls #{get(:project_dir)}", on: :host
  expect get(:project_file)

  node_name = 'PC1'
  target "Crear el nodo <#{node_name}>"
  run "jq '.topology.nodes[].name' #{get(:project_path)}", on: :host
  expect node_name

  node_name = 'PC2'
  target "Crear el nodo <#{node_name}>"
  run "jq '.topology.nodes[].name' #{get(:project_path)}", on: :host
  expect node_name

  node_name = 'Switch1'
  target "Crear el nodo <#{node_name}>"
  run "jq '.topology.nodes[].name' #{get(:project_path)}", on: :host
  expect node_name

end

group "Localizar la consola de cada dispositivo y guardar su valor" do

  node_name = 'PC1'
  cmd = "jq '.topology.nodes[] | select (.name == \"#{node_name}\") | .console' #{get(:project_path)}"
  run cmd, on: :host
  set("#{node_name.downcase}_console".to_sym, result.value)

  node_name = 'PC2'
  cmd = "jq '.topology.nodes[] | select (.name == \"#{node_name}\") | .console' #{get(:project_path)}"
  run cmd, on: :host
  set("#{node_name.downcase}_console".to_sym, result.value)

end
