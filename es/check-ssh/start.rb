
group "Check SSH connection" do

  target "Check hostname"
  run "hostname", on: :host
  expect get(:hostname)

end

play do
  show
  export
end
