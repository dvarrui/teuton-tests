group "Settings" do
  set(:pwd, Dir.pwd)

  docker = _cmd.join(" ")
  docker.gsub!("FOLDER", _folder)
  docker.gsub!("PWD", _pwd)
  set(:docker, docker)

  script = docker + " " + _script
  set(:script, script)
end
