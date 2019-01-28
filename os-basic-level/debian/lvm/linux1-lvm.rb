# encoding: utf-8

group "linux1: lvm (vgXXdebian)" do

  set(:vgXXdebian, "vg#{ get(:number) }debian")
  target "vgdisplay #{ get(:vgXXdebian) }"
  goto :linux1, :exec => "vgdisplay #{ get(:vgXXdebian) }"
  expect result.count.gt(0)

  set(:lvXXraiz, "lv#{ get(:number) }raiz")
  target get(:lvXXraiz)
  goto :linux1, :exec => "lvdisplay #{ get(:vgXXdebian) }"
  expect result.find("LV Name").find(get(:lvXXraiz)).count.equal?(1)

  set(:lvXXswap, "lv#{ get(:number) }swap")
  target get(:lvXXswap)
  goto :linux1, :exec => "lvdisplay #{ get(:vgXXdebian) }"
  expect result.find("LV Name").find(get(:lvXXswap)).count.equal?(1)

  set(:lvXXdatos, "lv#{ get(:number) }datos")
  target get(:lvXXdatos)
  goto :linux1, :exec => "lvdisplay #{ get(:vgXXdebian) }"
  expect result.find("LV Name").find(get(:lvXXdatos)).count.equal?(1)
end

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
