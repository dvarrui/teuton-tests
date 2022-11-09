
group "Setting OpenSUSE Settings" do
  hostname="#{get(:lastname1)}#{get(:number)}g1.#{get(:dominio)}"
  set(:opensuse1_hostname, hostname)
end

group 'Opensuse HOSTNAME configurations' do
  target "Checking hostname #{get(:opensuse1_hostname)}"
  goto  :opensuse1, :exec => "hostname -f"
  expect result.equal?(get(:opensuse1_hostname))

  unique "hostname", result.value
  goto  :opensuse1, :exec => "hostname -f"
  unique "UUID", result.value
end

group "Ensure UNIQUE values for opensuse1" do
  goto :opensuse1, :exec => "blkid |grep sda1"
  unique "UUID_sda1", result.value
  goto :opensuse1, :exec => "blkid |grep sda2"
  unique "UUID_sda2", result.value
  goto :opensuse1, :exec => "blkid |grep sda6"
  unique "UUID_sda6", result.value
  goto :opensuse1, :exec => "blkid |grep sda7"
  unique "UUID_sda7", result.value
end
