# encoding: utf-8

group "linux1: lvm (vgXXextra)" do

  set(:vgXXextra,"vg#{get(:number)}extra")
  target get(:vgXXextra)
  goto :linux1, :exec => "vgdisplay #{get(:vgXXextra)}"
  expect result.count.gt(0)

  set(:lvXXextra,"lv#{get(:number)}extra")
  target get(:lvXXextra)
  goto :linux1, :exec => "lvdisplay #{get(:vgXXextra)}"
  expect result.find("LV Name").find(get(:lvXXextra)).count.equal? 1

end
