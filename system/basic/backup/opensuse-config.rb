
group "Configure OpenSUSE 13.2" do

  target "SSH port 22 on <"+get(:host3_ip)+"> open"
  goto   :localhost, :exec => "nmap #{get(:host3_ip)} -Pn | grep ssh|wc -l"
  expect result.eq 1

  hostname3a="#{get(:lastname1)}3"
  target "Checking hostname -a <"+hostname3a+">"
  goto   :host3, :exec => "hostname -a"
  expect result.eq hostname3a

  hostname3b="#{get(:lastname2)}"
  target "Checking hostname -d <"+hostname3b+">"
  goto   :host3, :exec => "hostname -d"
  expect result.eq hostname3b

  hostname3c="#{hostname3a}.#{hostname3b}"
  target "Checking hostname -f <"+hostname3c+">"
  goto   :host3, :exec => "hostname -f"
  expect result.eq hostname3c

  goto   :host3, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto   :host3, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value

end

group "Configure users" do

  username=get(:firstname)

  target "User <#{username}> exists"
  goto   :host3, :exec => "id '#{username}' | wc -l"
  expect result.equal(1)

  target "Users <#{username}> with not empty password "
  goto   :host3, :exec => "cat /etc/shadow | grep '#{username}:' | cut -d : -f 2| wc -l"
  expect result.equal(1)

  target "User <#{username}> logged"
  goto   :host3, :exec => "last | grep #{username[0,8]} | wc -l"
  expect result.not_equal(0)
end
