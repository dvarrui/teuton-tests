
group "Android" do

  target "Environ OSTYPE"
  run "echo $OSTYPE"
  expect "linux-android"

  result.restore
  if result.count.eq 1
    set(:ostype, 'android')
  end
end
