
group "MV configuration" do

  target "Hostname <#{get(:hostname)}>"
  run "hostname -a", on: :host1
  expect result.equal(get(:hostname))

  target "Domainname <#{get(:domain)}>"
  run "hostname -d", on: :host1 
  expect result.equal(get(:domain)), :weight => 2.0

end
