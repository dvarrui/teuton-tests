
group "Squid installation" do

  target "Squid Service ON"
  goto :host1, :exec => "systemctl status squid3"
  expect result.find("Active: active (running)").count.eq(1)

  target "Squid port 3128"
  goto :host1, :exec => "lsof -i"
  expect result.find("squid").find("localhost:3128").count.eq(1)

end
