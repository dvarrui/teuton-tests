
group "linux: vgXXdebian" do
  target "Create VG called #{gett(:vgXXdebian)}"
  goto :linux, :exec => "vgdisplay #{get(:vgXXdebian)}"
  expect result.count.gt(0)

  target "Create LV called #{gett(:lvXXraiz)} into VG #{gett(:vgXXdebian)}"
  result.restore!
  expect_one ["LV Name", get(:lvXXraiz)]

  target "Create LV called #{gett(:lvXXswap)} into VG #{gett(:vgXXdebian)}"
  result.restore!
  expect_one ["LV Name", get(:lvXXswap)]

  target "Create LV called #{gett(:lvXXdatos)} into VG #{gett(:vgXXdebian)}"
  result.restore!
  expect_one ["LV Name", get(:lvXXdatos)]
end
