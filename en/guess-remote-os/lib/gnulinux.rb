
group "GNU/Linux" do

  target "Guess remote OS"
  run "stat /home"
  expect "/home"

  result.restore
  if result.grep("home").count.gt 0
    set(:ostype, 'gnulinux')
  end
end
