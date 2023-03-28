
group "Register Information" do
  run "blkid |grep sda1", on: :debian1
  log ("debian1_sda1_UUID = #{result.value}")

  run "blkid |grep sda1", on: :debian2
  log ("debian2_sda1_UUID = #{result.value}")

  run "ip a", on: :debian1
  mac=result.grep!("link/ether").value
  log ("debian1_MAC = #{mac}")
  unique "MAC", mac

  run "ip a", on: :debian2
  mac=result.grep!("link/ether").value
  log ("debian2_MAC = #{mac}")
  unique "MAC", mac

  run "ipconfig /all", on: :windows1
  mac=result.find!("Direcci").content[0]
  log ("windows1_MAC = #{mac}")
  unique "MAC", mac

end
