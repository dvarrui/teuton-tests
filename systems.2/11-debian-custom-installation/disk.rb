
group "Disk size" do
  size='10G'
  target "Disk sda size <#{size}>"
  goto  :host1, :exec => "lsblk"
  expect_one [ 'disk', 'sda', size ]

  goto  :host1, :exec => "blkid | grep sda1"
  unique "UUID_sda1", result.value
end

group "Partitions size and type" do

  partitions={ :sda5 => ['[SWAP]','953M', '952M'],
               :sda6 => ['/'     ,'6,5G', '6,5G'],
               :sda7 => ['/home' ,'476M', '475M'],
               :sda8 => ['sda8'  ,'94M' , '93M']
                }

  partitions.each_pair do |key,value|

    target "Partition #{key} mounted on <#{value[0]}>"
    goto  :host1, :exec => "lsblk"
    expect_one [ "part", key, value[0] ]

    target "Partition #{key} size near at <#{value[1]}>"
    goto  :host1, :exec => "lsblk |grep part| grep #{key}| tr -s ' ' ':'| cut -d ':' -f 5"
    expect result.near?(value[1])
#    expect(result.to_s.equal?(value[1]) || result.to_s.equal?(value[2]))
  end

  target "Partition <sda6> with type <ext4>"
  goto  :host1, :exec => "df -hT"
  expect_one ['/dev/sda6', 'ext4', '/']

  target "Partition <sda7> with type <ext3>"
  goto  :host1, :exec => "df -hT"
  expect_one ['/dev/sda7', 'ext3', '/']

  target "Partition <sda8> unmounted"
  goto  :host1, :exec => "df -hT"
  expect_none '/dev/sda8'
end
