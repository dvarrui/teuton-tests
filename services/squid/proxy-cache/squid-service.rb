
group "Squid installation" do
  target "Squid Service ON"
  goto :host1, :exec => "systemctl status squid3"
  expect result.find("Active: active (running)").count.eq(1)

  target "Squid service working on port 3128"
  goto :host1, :exec => "lsof -i"
  expect result.find("squid").find("localhost:3128").count.eq(1)
end

group "Squid configuration" do
  target "Squid service working on port 3128"
  goto :host1, :exec => "lsof -i"
  expect result.find("http_port").find(get(:ip)+":3128").count.eq(1)

  target "Squid port 3128"
  goto :host1, :exec => "cat /etc/squid/squid.conf"
  expect result.find("http_port ").find(get(:ip)+":3128").count.eq(1)

  target "cache mem 100 MB"
  goto :host1, :exec => "cat /etc/squid/squid.conf"
  expect result.find("cache_mem ").find(" 100 MB").count.eq(1)

  target "cache dir 500 MB"
  run "cat /etc/squid/squid.conf"
  expect result.find("cache_dir ").find(" 500 ").count.eq(1)

  target "access_log"
  run "cat /etc/squid/squid.conf"
  expect result.find("access_log ").find("/var/log/squid/access.log").count.eq(1)
end

group "Squid: client access" do
  target "URL Web URL access"
  run "cat /var/log/squid/access.log"
  expect result.find(get(:web)).count.ge(1)
end
