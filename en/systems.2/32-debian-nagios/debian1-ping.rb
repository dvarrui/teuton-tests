
group "Ping from debian1 to *" do

  target "ping debian1 to debian2_ip"
  run "ping #{get(:debian2_ip)} -c 1", on: :debian1
  expect_one "64 bytes from"

  target "ping debian1 to debian2_name"
  run "ping #{@short_hostname[2]} -c 1", on: :debian1
  expect_one "64 bytes from"

  target "ping debian1 to windows1_ip"
  run "ping #{get(:windows1_ip)} -c 1", on: :debian1
  expect_one "64 bytes from"

  target "ping debian1 to windows1_name"
  run "ping #{@short_hostname[3]} -c 1", on: :debian1
  expect_one "64 bytes from"

end
