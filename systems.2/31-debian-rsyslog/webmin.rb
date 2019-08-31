#
task :webmin_on_host1 do

  target "Webmin installed"
  goto :host1, :exec => "dpkg -l webmin| grep webmin| wc -l"
  expect result.equal? 1

  target "Executing Webmin"
  goto :host1, :exec => "ps -ef|grep webmin| wc -l"
  expect result.equal? 1

  target "Webmin working on port 10000"
  goto :host1, :exec => "netstat -ntap|grep webmin| grep '127.0.0.1:10000'| wc -l"
  expect result.equal? 1

end
