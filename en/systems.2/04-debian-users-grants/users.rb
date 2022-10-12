

group "Checking Starwars Characters" do

  target "Exists user <#{get(:username)}>"
  run "id #{ get(:username) }", on: :host1
  expect result.count.equal(1)

  result.restore!

  target "User <#{ get(:username) }> is member of <#{ get(:groupname) }>"
  expect result.grep( "("+get(:groupname)+")" ).count.equal(1)

end
