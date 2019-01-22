
group "Host configuration" do
  set(:ip, "10.1.105.1" + get(:number).to_s)

  target "IP 10.1.105.1XX"
  goto :host1, :exec => "ip a"
  expect result.find("inet").find(get(:ip)).count.eq(1)

  target "DNS 8.8.8.8"
  goto :host1, :exec => "nslookup www.github.com"
  expect result.find("Server:").find("8.8.8.8").count.eq(1)

  target "DNS OK"
  goto :host1, :exec => "nslookup www.github.com"
  expect result.find("Name:").find("github.com").count.ge(1)
end
