
group "Checking Starwars Directories" do

  target "Directory <friends>"
  goto :host1, :exec => "vdir #{ "/home/"+get(:username) }"
  expect result.grep(/^drwxrwx---/).grep( get(:groupname) ).grep("friends").count.equal(1)

  result.restore!

  target "Directory <starwars>"
  expect result.grep(/^drwxrwxrwx/).grep( "users" ).grep(/starwars/).count.equal(1)

end
