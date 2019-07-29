

group "Checking Starwars Characters" do

  target "Exists user <#{get(:username)}>"
  goto :host1, :exec => "id #{ get(:username) }"
  expect result.count.equal(1)

  result.restore!

  target "User <#{ get(:username) }> is member of <#{ get(:groupname) }>"
  expect result.grep( "("+get(:groupname)+")" ).count.equal(1)

end
