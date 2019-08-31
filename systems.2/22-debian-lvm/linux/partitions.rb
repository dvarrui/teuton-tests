
group "Checking partitions on Debian (linux)" do
  target "Disk sdb with more than 1 partition"
  goto :linux, :exec => "fdisk -l"
  expect result.find('sdb').count.gt(1)

  target "Disk sdc with more than 3 partitions"
  goto :linux, :exec => "fdisk -l"
  expect result.find('sdc').count.gt(3)
end

group "Checking /boot partition on Debian (linux)" do
  target "Ensure sda1 partition mounted on /boot"
  goto :linux, :exec => "df -hT"
  expect_one [ '/boot', "/dev/sda1" ]

  target "Verifing /boot partition size"
  goto :linux, :exec => "df -hT"
  expect_one ['/boot', "92M" ]

  target "Ensure /boot partition format is ext2"
  goto :linux, :exec => "df -hT"
  expect_one [ '/boot', "ext2" ]
end
