
group 'Settings' do
  whoami = `whoami`.chop
  home = "/home/#{whoami}"
  set(:whoami, whoami)
  set(:home, home)
end

group "Valid Directory tree" do

  folders = [ 'space', 'space/kessel',
              'space/jedha', 'space/skarif' ]

  folders.each do |dir|
    folder = "#{home?}/#{dir}"
    target "Create folder #{folder}"
    goto :localhost, :exec => "file #{folder}"
    expect [ folder, ': directory' ]
  end
end

group "Invalid Directory tree" do
  readme 'Tip: Use mv to rename files or directories.'
  readme 'Tip: Use rmdir remove empty directories.'

  folders = [ 'Space', 'Space/Kessel',
              'Space/Jedha', 'Space/Skarif' ]

  folders.each do |dir|
    folder = "#{home?}/#{dir}"
    target "Rename or remove folder #{folder}"
    goto :localhost, :exec => "file #{folder}"
    expect_one [ folder, 'cannot open', 'No such' ]
  end
end

play do
  export
end
