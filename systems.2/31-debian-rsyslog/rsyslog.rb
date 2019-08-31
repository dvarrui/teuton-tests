
group "Rsyslog on host1" do
  file = "/etc/rsyslog.d/#{get(:firstname)}.conf"
  target "Exist rsyslog configuration file #{file}"
  goto :host1, :exec => "file #{file}"
  expect_one "text"

  file = "/var/log/#{get(:firstname)}/prueba-local.log"
  target "Exist #{file} log file"
  goto :host1, :exec => "file #{file}"
  expect_one 'text'

  target "Configure #{file} with Rsyslog, to receave local0.info log messages"
  content = "teuton_"+(rand 100).to_s
  goto :host1, :exec => "logger -p local0.info '#{content}'"
  goto :host1, :exec => "cat #{file}"
  expect content
end

group "Configure Rsyslog/logrotate into host1" do
  file = "/etc/logrotate.d/#{get(:firstname)}"
  target "Exist logrotate configuration file #{file}"
  goto :host1, :exec => "file #{file}"
  expect_one 'text'

  target "Logrotate configuration contains our log file"
  goto :host1, :exec => "cat #{file}"
  expect_one "/var/log/#{get(:firstname)}/prueba-local.log"
end
