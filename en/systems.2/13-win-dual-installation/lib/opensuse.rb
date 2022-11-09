
group "Setting OpenSUSE Settings" do
  hostname="#{get(:lastname1)}#{get(:number)}g1.#{get(:dominio)}"
  set(:opensuse1_hostname, hostname)
end

group 'Opensuse HOSTNAME configurations' do
  target "Checking hostname #{get(:opensuse1_hostname)}"
  run "hostname -f", on: :opensuse1
  expect result.equal?(get(:opensuse1_hostname))

  unique "hostname", result.value
end

group "Ensure UNIQUE values for opensuse1" do
  run "blkid |grep sda1", on: :opensuse1
  unique "UUID_sda1", result.value
  run "blkid |grep sda2", on: :opensuse1
  unique "UUID_sda2", result.value
  run "blkid |grep sda6", on: :opensuse1
  unique "UUID_sda6", result.value
  run "blkid |grep sda7", on: :opensuse1
  unique "UUID_sda7", result.value
end
