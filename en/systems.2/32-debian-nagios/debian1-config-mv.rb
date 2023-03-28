
group "Configure host Debian1" do

  target "ping to debian1"
  run "ping #{get(:debian1_ip)} -c 1"
  expect_none  "Destination Host Unreachable"

  target "SSH port 22 open on debian1"
  run "nmap #{get(:debian1_ip)} -Pn"
  expect_one "ssh"

  @student_number=get(:debian1_ip).split(".")[2]||"999"
  @student_number="0"+@student_number if @student_number.size==1
  @short_hostname=[]
  @short_hostname[1]="#{get(:lastname1)}#{@student_number}d"

  target "Checking hostname -a => "+@short_hostname[1]
  run "hostname -a", on: :debian1
  expect result.eq @short_hostname[1]

  target "Checking hostname -d <"+get(:domain)+">"
  run "hostname -d", on: :debian1
  expect result.eq get(:domain)

  @long_hostname=[]
  @long_hostname[1]="#{@short_hostname[1]}.#{get(:domain)}"

  target "Checking hostname -f <"+@long_hostname[1]+">"
  run "hostname -f", on: :debian1
  expect result.eq @long_hostname[1]

  target "Exists user <#{get(:firstname)}"
  run "cat /etc/passwd | grep '#{get(:firstname)}:' |wc -l", on: :debian1
  expect result.gt 0

  target "Gateway <#{get(:gateway)}"
  run "route -n|grep UG|grep #{get(:gateway)} |wc -l", on: :debian1
  expect result.eq 1

  target "DNS <#{get(:dns)}> is running"
  run "ping #{get(:dns)} -c 1| grep '1 received' |wc -l", on: :debian1
  expect result.gt 0

  target "DNS works!"
  run "host www.iespuertodelacruz.es |grep 'has address' |wc -l", on: :debian1
  expect result.gt 0

  run "blkid |grep sda1", on: :debian1
  unique "debian1_sda1_UUID", result.value

  @uuid_debian1=result.value
end
