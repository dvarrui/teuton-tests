
group "Disk size" do
  size = '18'
  target "Disk sda size <#{size}>"
  goto :opensuse1, :exec => "lsblk"
  expect_one ['disk', 'sda', size, 'G']
end

group "Partitions size and type" do
  partitions={ :sda1 => ['sda1'  ,'11,7G' , '12G'],
               :sda2 => ['sda2'  ,'100M' , '100M'],
               :sda5 => ['[SWAP]','500M', '500M'],
               :sda6 => ['/home' ,'100M', '107M'],
               :sda7 => ['/'     ,'5G', '5,3G']
                }

  partitions.each_pair do |key, value|
    target "Partition #{key} mounted on <#{value[0]}>"
    goto :opensuse1, :exec => "lsblk"
    expect_one ['part', key, value[0]]

    target "Partition #{key} size <#{value[1]}>"
    goto :opensuse1, :exec => "lsblk |grep part| grep #{key}| tr -s ' ' ':'| cut -d ':' -f 5"
    expect(result.to_s.equal?(value[1]) || result.to_s.equal?(value[2]))
  end

  partitions={ :sda6 => ['/dev/disk', '/home', 'ext3'],
               :sda7 => ['/dev/disk', '/'    , 'ext4']
             }

  partitions.each_pair do |key, value|
    target "Partition #{key} type #{value[2]}"
    goto :opensuse1, :exec => "df -hT"
    expect_one [ key, value[2] ]
  end
end
