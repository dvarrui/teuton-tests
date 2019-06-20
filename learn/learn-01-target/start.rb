
group "learn-01-target" do

  target "Exist <david> user"
  run "id david"
  expect "david"

end

play do
  show
  export
end
