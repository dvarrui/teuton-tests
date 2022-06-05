
group "Windows" do

  target "Guess remote OS"
  run "dir C:\\"
  expect "Windows"

  result.restore
  if result.grep("Windows").count.gt 0
    set(:ostype, 'windows')
  end
end
