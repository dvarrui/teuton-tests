
group 'Hostname configuration' do
  my_hostname = "ssh-server#{get(:number)}q"

  target "Set hostname to #{my_hostname}."
  goto  :host1, :exec => "hostname"
  expect_one my_hostname
end
