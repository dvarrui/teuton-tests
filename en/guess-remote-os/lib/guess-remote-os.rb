
group "Android" do
  target "Environ OSTYPE"
  run "echo $OSTYPE"
  expect "linux-android"

  result.restore
  if result.count.eq 1
    set(:ostype, 'android')
  end
end

group "GNU/Linux" do
  target "Environ OSTYPE"
  run "echo $OSTYPE"
  expect "linux-gnu"

  target "Exist /home folder"
  run "stat /home"
  expect "/home"

  result.restore
  if result.grep("home").count.gt 0
    set(:ostype, 'gnulinux')
  end
end

group "Windows" do
  target "Guess remote OS"
  run "dir C:\\"
  expect "Windows"

  result.restore
  if result.grep("Windows").count.gt 0
    set(:ostype, 'windows')
  end
end
