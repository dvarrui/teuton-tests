
group "Host configuration" do

  target "IP 10.1.105.1XX"
  run "ip a"
  expect result.find("inet").find(get(:ip)).count.eq(1)

  target "DNS 8.8.8.8"
  run "nslookup www.github.com"
  expect result.find("Server:").find("8.8.8.8").count.eq(1)

  target "DNS OK"
  run "nslookup www.github.com"
  expect result.find("Name:").find("github.com").count.ge(1)
end
