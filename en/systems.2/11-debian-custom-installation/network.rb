
group 'Network configuration' do

  target "Network gateway configuration working"
  run "ping 8.8.4.4 -c 1", on: :host1
  expect "64 bytes from 8.8.4.4"

  target "Network DNS configuration working"
  run "host www.nba.com", on: :host1
  expect "has address"

end
