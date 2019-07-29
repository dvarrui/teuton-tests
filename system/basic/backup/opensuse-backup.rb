
group "Create files to be saved" do

  files1=['manual11.txt','manual12.txt','manual13.txt']
  dir1="/home/#{get(:firstname)}1/mydocs/"

  files1.each do |filename|
    filepath=dir1+filename
    target "Exist file <#{filepath}>"
    goto  :host3, :exec => "file '#{filepath}' | wc -l"
    expect result.equal(1)
  end

  files2=['manual21.txt','manual22.txt','manual23.txt']
  dir2="/home/#{get(:firstname)}2/mydocs/"

  files2.each do |filename|
    filepath=dir2+filename
    target "Exist file <#{filepath}>"
    goto   :host3, :exec => "file '#{filepath}' | wc -l"
    expect result.equal(1)
  end
end

group "Check backup output" do

  username=get(:firstname)+"1"
  groupname="root"

  pcnumber=get(:host3_ip).split(".")[2]
  dir="/var/backup-#{pcnumber}/#{get(:firstname)}1"

  target "Exist directory <#{dir}>"
  goto   :host3, :exec => "file '#{dir}' | grep directory| wc -l"
  expect result.equal(1)

  target "Owner/Group of <#{dir}>"
  goto   :host3, :exec => "vdir '#{dir}' -d | grep #{username}|grep #{groupname} |wc -l"
  expect result.equal(1)

  target "Permisions of <#{dir}> must be <drwxrwx--->"
  goto   :host3, :exec => "vdir '#{dir}' -d | grep 'drwxrwx--- '| wc -l"
  expect result.equal(1)

end
