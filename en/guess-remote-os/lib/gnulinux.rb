
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
