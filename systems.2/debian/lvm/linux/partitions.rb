
group "Checking partitions on Debian (linux1)" do

  target "Disk sdb with more than 1 partition"
  goto :linux1, :exec => "fdisk -l"
  expect_any 'sdb'

  target "Disk sdc with more than 3 partitions"
  goto :linux1, :exec => "fdisk -l"
  expect result.find('sdc').count.gt(3)

end

group "Checking /boot partition on Debian (linux1)" do

  target "Ensure sda1 partition mounted on /boot"
  goto :linux1, :exec => "df -hT"
  expect_one [ '/boot', "/dev/sda1" ]

  target "Verifing /boot partition size"
  goto :linux1, :exec => "df -hT"
  expect result.find('/boot').find("92M").count.eq(1)

  target "Ensure /boot partition format is ext2"
  goto :linux1, :exec => "df -hT"
  expect_one [ '/boot', "ext2" ]

end

group "Logical Volumes on Debian (linux1)" do

  target "lv#{get(:number)}datos partition size and format"
  goto :linux1, :exec => "df -hT"
  expect result.find("lv#{get(:number)}datos").find("ext3").count.eq(1)

  target "lv#{get(:number)}raiz partition size and format"
  goto :linux1, :exec => "df -hT"
  expect result.find("lv#{get(:number)}raiz").find("ext4").count.eq(1)

end
