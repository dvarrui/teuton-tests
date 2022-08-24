
group "Check SSH connection" do

  target "Check hostname"
  run "hostname", on: :host
  expect get(:hostname)

end

play do
  show
  export format: :colored_text
  send copy_to: :host
end
