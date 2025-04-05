group "Localizar los puertos de los dispositivos" do

  project_path = "#{get(:project_dir)}/#{get(:project_file)}"

  target "Crear el proyecto GNS3 <#{project_path}>"
  run "ls #{get(:project_dir)}"
  expect get(:project_file)

  nodes = ['PC1','PC2','Switch1']
  set(:nodes, nodes)

  nodes.each do |node|
    target "Crear el nodo <#{node}>"
    run "jq '.topology.nodes[].name' #{project_path}"
    expect node

    # Localizar la consola
    cmd = "jq '.topology.nodes[] | select (.name == \"#{node}\") | .console' #{project_path}"
    run cmd
    # Guardar el valor de la consola para el nodo
    set("#{node.downcase}_console".to_sym, result.value)
  end
end
