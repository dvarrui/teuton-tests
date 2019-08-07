
group "Users and groups" do

  items = []
  items << { user: 'alumno1', maingroup: 'alumno1', group: 'alumnos' }
  items << { user: 'alumno2', maingroup: 'alumno2', group: 'alumnos' }
  items << { user: 'alumno3', maingroup: 'alumno3', group: 'alumnos' }
  items << { user: 'profe1', maingroup: 'profe1', group: 'profesores' }
  items << { user: 'profe2', maingroup: 'profe2', group: 'profesores' }
  items << { user: 'profe3', maingroup: 'profe3', group: 'profesores' }

  items.each do |item|
    target "Create user <#{item[:user]}>"
    run "id #{item[:user]} -un"
    expect item[:user]

    target "User <#{item[:user]}> with MainGroup <#{item[:maingroup]}>"
    run "id #{item[:user]} -gn"
    expect item[:maingroup]

    target "User <#{item[:user]}> is member of <#{item[:group]}>"
    run "id #{item[:user]} -Gn"
    expect item[:group]
  end
end
