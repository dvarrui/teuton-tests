
group "MV configuration" do

  target "Hostname <#{get(:hostname)}>"
  goto :host1, :exec => "hostname -a"
  expect result.equal(get(:hostname))

  target "Domainname <#{get(:domain)}>"
  goto :host1, :exec => "hostname -d"
  expect result.equal(get(:domain)), :weight => 2.0

end
