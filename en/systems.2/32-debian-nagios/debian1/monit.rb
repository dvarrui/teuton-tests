
group "Debian1: Monit configuration" do

  file = "/etc/monit/monitrc"

  target "File <#{file}.bak> exist"
  run "file #{file}.bak", on: :debian1
  expect_one "text"

  target "File <#{file}> exist"
  run "file #{file}", on: :debian1
  expect_one "text"

  texts = []
  texts << [ "set daemon"      , "120" ]
  texts << [ "set logfile"     , "/var/log/monit.log" ]
  texts << [ "set mailserver"  , "localhost" ]
  texts << [ "set alert"       , "@" ]
  texts << [ "set mail-format" , "{" ]
  texts << [ "from:"           , "@" ]
  texts << [ "subject:"        , "$SERVICE" ]
  texts << [ "subject:"        , "$EVENT" ]
  texts << [ "subject:"        , "at $DATE" ]
  texts << [ "message:"        , "Monit $ACTION $SERVICE at $DATE on $HOST: $DESCRIPTION." ]
  texts << [ "Yours sincerely,", "monit" ]
  texts << [ "set httpd port 2812", "and use address localhost" ]
  texts << [ "allow "          , "#{get(:firstname)}:" ]
  texts << [ "check system"    , "localhost" ]
  texts << [ "if loadavg (1min)", ">", "4", "then alert" ]
  texts << [ "if loadavg (5min)", ">", "2", "then alert" ]
  texts << [ "if memory usage"  , ">", "75%", "then alert" ]
  texts << [ "if cpu usage (user)", ">", "70%", "then alert" ]
  texts << [ "if cpu usage (system)", ">", "30%", "then alert" ]
  texts << [ "if cpu usage (wait)", ">", "20%", "then alert" ]
  texts << [ "check process sshd with pidfile", "/var/run/sshd.pid" ]
  texts << [ "start program" , "service sshd start" ]
  texts << [ "stop program"  , "service sshd stop" ]
  texts << [ "if failed port 22 protocol ssh then restart" ]
  texts << [ "if 5 restarts within 5 cycles then timeout" ]

  texts.each do |text|
    target "<#{file}> must contain <#{text.join(" ")}> line", :weight => 0.2
    run "cat #{file}", on: :debian1

    text.each { |item| result.find(item) }
    expect result.not_find("#").count.eq(1)
  end
end

group "Debian1: Restart Monit service" do

  target "Debian1: Stop monit service"
  run "service monit stop", on: :debian1
  run "service monit status", on: :debian1
  expect_one [ "Active", "inactive" ]

  target "Debian1: Start monit service", :weight => 2
  run "service monit start", on: :debian1
  run  "service monit status", on: :debian1
  expect_one [ "Active", "active" ]

  target "Debian1: monit working on por 2812", :weight => 2
  run "netstat -ntap", on: :debian1
  expect_one [ "2812", "monit" ]

#  target "nmap debian1"
#  goto :localhost, :exec => "nmap -Pn #{get(:debian1_ip)}"
#  expect result.find!("2812/tcp").find!("open").count!.eq(1)

end
