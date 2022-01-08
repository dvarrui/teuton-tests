
group "Settings" do
  set(:win_ip, get(:ip_prefix) + get(:number).to_i.to_s + '.11')
  set(:win_hostname, get(:lastname) + get(:number).to_s + 'w')

  set(:masterwin_ip, get(:ip_prefix) + get(:number).to_i.to_s + '.12')
  set(:masterwin_hostname, get(:lastname) + get(:number).to_s + 'w2')

  set(:suse_ip, get(:ip_prefix) + get(:number).to_i.to_s + '.31')
  set(:suse_hostname, get(:lastname) + get(:number).to_s + 'g')

  set(:mastersuse_ip, get(:ip_prefix) + get(:number).to_i.to_s + '.32')
  set(:mastersuse_hostname, get(:lastname) + get(:number).to_s + 'g2')
end
