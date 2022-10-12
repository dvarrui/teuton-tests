
group "Create files to be saved" do
  files1 = ['manual11.txt','manual12.txt','manual13.txt']
  dir1   = "/home/#{get(:firstname)}1/mydocs/"

  files1.each do |filename|
    filepath = dir1+filename
    target "Exist file #{filepath}"
    run "file '#{filepath}'", on: :opensuse
    expect_one filepath
  end

  files2 = ['manual21.txt','manual22.txt','manual23.txt']
  dir2   = "/home/#{get(:firstname)}2/mydocs/"

  files2.each do |filename|
    filepath = dir2 + filename
    target "Exist file #{filepath}"
    run "file '#{filepath}'", on: :opensuse
    expect_one filepath
  end
end

group "Check backup output" do
  username  = get(:firstname) + "1"
  groupname = "root"

  pcnumber = get(:opensuse_ip).split(".")[2] || '99'
  dir      = "/var/backup-#{pcnumber}/#{get(:firstname)}1"

  target "Exist directory #{dir}"
  run "file '#{dir}'", on: :opensuse
  expect_one [dir, "directory"]

  target "#{dir} owner/group is #{username}/#{groupname}"
  run "vdir '#{dir}' -d", on: :opensuse
  expect_one [ username, groupname ]

  target "Permisions of #{dir} must be drwxrwx---"
  run "vdir '#{dir}' -d", on: :opensuse
  expect_one 'drwxrwx--- '
end
