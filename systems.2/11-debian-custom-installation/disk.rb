
group "Disk and partitions" do
  size = '10G'
  target "Disk sda size <#{size}>"
  run "lsblk", on: :host1
  expect_one [ 'disk', 'sda', size ]

  run "blkid | grep sda1", on: :host1
  unique "UUID_sda1", result.value

  partitions={ :sda5 => ['[SWAP]','953M', '952M'],
               :sda6 => ['/'     ,'6,5G', '6,5G'],
               :sda7 => ['/home' ,'476M', '475M'],
               :sda8 => ['sda8'  ,'94M' , '93M']
                }

  partitions.each_pair do |key, value|

    target "Partition #{key} mounted on <#{value[0]}>"
    run "lsblk", on: :host1
    expect_one [ "part", key, value[0] ]

    target "Partition #{key} size near at <#{value[1]}>"
    run  "lsblk |grep part| grep #{key}| tr -s ' ' ':'| cut -d ':' -f 5", on: :host1
    expect result.near?(value[1])
  end

  target "Partition <sda6> with type <ext4>"
  run "df -hT", on: :host1
  expect_one ['/dev/sda6', 'ext4', '/']

  target "Partition <sda7> with type <ext3>"
  run "df -hT", on: :host1
  expect_one ['/dev/sda7', 'ext3', '/home']

  target "Partition <sda8> unmounted"
  run "df -hT", on: :host1
  expect_none '/dev/sda8'
end
