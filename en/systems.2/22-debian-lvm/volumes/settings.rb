group "Settings" do
  set(:vgXXdebian, "vg#{ get(:number) }debian")
  set(:lvXXraiz, "lv#{ get(:number) }raiz")
  set(:lvXXswap, "lv#{ get(:number) }swap")
  set(:lvXXdatos, "lv#{ get(:number) }datos")
end
