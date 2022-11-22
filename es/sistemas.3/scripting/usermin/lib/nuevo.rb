group "Opción --nuevo USERNAME" do
  script = get(:script)
  users = get(:nuevo)
  peso = 20.0/users.size

  users.each do |name|
    target "script --nuevo #{name}", weight: peso
    run "#{script} --nuevo #{name} teuton /bin/bash 123456", on: :host1
    run "cat /etc/passwd", on: :host1
    expect_one ":teuton:/home/#{name}:/bin/bash"
  end
end
