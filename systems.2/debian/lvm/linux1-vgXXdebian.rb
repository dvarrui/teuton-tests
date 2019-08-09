
group "linux1: vgXXdebian" do

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
