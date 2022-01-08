
group "Logical Volumes on Debian (linux)" do
  target "LV #{gett(:lvXXdatos)} with ext3 format"
  goto :linux, :exec => "df -hT"
  expect_one [get(:lvXXdatos), "ext3" ]

  target "LV #{gett(:lvXXraiz)} with ext4 format"
  result.restore!
  expect_one [get(:lvXXraiz), "ext4" ]
end
