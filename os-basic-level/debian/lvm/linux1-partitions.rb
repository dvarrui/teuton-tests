# encoding: utf-8

group "linux1: lvm (partitions)" do

  target "Disk sdb"
  goto :linux1, :exec => "fdisk -l"
  expect result.find('sdb').count.gt 1

  target "Disk sdc"
  goto :linux1, :exec => "fdisk -l"
  expect result.find('sdc').count.gt(3)

end

group "linux1: /boot"

  target "/boot partition sda1"
  goto :linux1, :exec => "df -hT"
  expect result.find('/boot').find("/dev/sda1").count.eq(1)

  target "/boot partition size"
  goto :linux1, :exec => "df -hT"
  expect result.find('/boot').find("92M").count.eq(1)

  target "/boot partition format"
  goto :linux1, :exec => "df -hT"
  expect result.find('/boot').find("ext2").count.eq(1)

end

group "linux1: volúmenes lógicos"

  target "lv#{get(:number)}datos partition size and format"
  goto :linux1, :exec => "df -hT"
  expect result.find("lv#{get(:number)}datos").find("ext3").count.eq(1)

  target "lv#{get(:number)}raiz partition size and format"
  goto :linux1, :exec => "df -hT"
  expect result.find("lv#{get(:number)}raiz").find("ext4").count.eq(1)

end
