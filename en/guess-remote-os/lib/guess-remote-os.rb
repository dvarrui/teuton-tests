
group "Android" do
  target "Environ OSTYPE=linux-android"
  run "echo $OSTYPE | grep linux-android"

  if result.count.eq 1
    set(:ostype, 'android')
  end
end

group "GNU/Linux" do
  target "Environ OSTYPE=linux-gnu"
  run "echo $OSTYPE | grep linux-gnu"

  if result.count.eq 1
    set(:ostype, 'gnulinux')
  end
end

group "Windows" do
  target "Guess remote OS"
  run "dir C:\\"

  if result.grep("Windows").count.gt 0
    set(:ostype, 'windows')
  end
end
