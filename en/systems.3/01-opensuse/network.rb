
group 'Network configuration' do

  target "Ensure routing is working."
  goto  :host1, :exec => "ping 8.8.4.4 -c 1"
  expect_one "64 bytes from 8.8.4.4"

  target "Ensure DNS resolution is working."
  goto  :host1, :exec => "host www.nba.com"
  expect "has address"
end
