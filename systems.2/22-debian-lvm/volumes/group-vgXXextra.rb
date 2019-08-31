
group "linux: Cheking VG vgXXextra and their LV." do
  set(:vgXXextra,"vg#{get(:number)}extra")

  target "Create VG called #{gett(:vgXXextra)}"
  goto :linux, :exec => "vgdisplay #{get(:vgXXextra)}"
  expect result.count.gt(0)

  set(:lvXXextra,"lv#{get(:number)}extra")
  target "Create LV called #{gett(:lvXXextra)} into VG #{gett(:vgXXextra)}"
  goto :linux, :exec => "lvdisplay #{get(:vgXXextra)}"
  expect_one ["LV Name", get(:lvXXextra)]
end
