
group "Activating ACL on partition" do
  target "Chech sda disk with 5 partitions"
  goto :host1, :exec => "lsblk"
  expect result.grep("sda").count.eq 6

  target "Check sdb disk with 1 partition"
  result.restore!
  expect result.grep("sdb").count.eq 2

  target "sdb1 part is mounted and has type ext3"
  goto :host1, :exec => "df -hT"
  expect_one [ "/dev/sdb1", "ext3" ]

  target "On every boot, mount sdb1 on /mnt/starwars directory"
  goto :host1, :exec => "cat /etc/fstab"
  expect_one [ "/dev/sdb1", "/mnt/starwars" ]
end
