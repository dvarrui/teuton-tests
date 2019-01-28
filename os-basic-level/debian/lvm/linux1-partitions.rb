# encoding: utf-8

group "linux1: lvm (partitions)" do

  target "Disk sdb"
  goto :linux1, :exec => "fdisk -l"
  expect result.find('sdb').count.gt 1

  target "Disk sdc"
  goto :linux1, :exec => "fdisk -l"
  expect result.find('sdc').count.gt(3)

  target "/boot partition size and format"
  goto :linux1, :exec => "df -hT"
  expect result.find('/boot').find("100M").find("ext2").count.eq(1)

  target "lv#{get(:number)}datos partition size and format"
  goto :linux1, :exec => "df -hT"
  expect result.find("lv#{get(:number)}datos").find("ext3").count.eq(1)

  target "lv#{get(:number)}raiz partition size and format"
  goto :linux1, :exec => "df -hT"
  expect result.find("lv#{get(:number)}raiz").find("ext4").count.eq(1)
  
end
