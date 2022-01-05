
group "Valid Directory tree" do
  whoami = `whoami`.chop
  home = "/home/#{whoami}"

  folders = [ 'space', 'space/kessel',
              'space/jedha', 'space/skarif' ]

  folders.each do |dir|
    folder = "#{home}/#{dir}"
    target "Create folder #{folder}"
    goto :localhost, :exec => "file #{folder}"
    expect [ folder, ': directory' ]
  end
end

group "Invalid Directory tree" do
  readme 'Tip: Use mv to rename files or directories.'
  readme 'Tip: Use rmdir remove empty directories.'

  whoami = `whoami`.chop
  home = "/home/#{whoami}"
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
  show
  export
end
