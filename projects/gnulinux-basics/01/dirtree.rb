group "Directory tree" do

  whoami = `whoami`.chop
  home = "/home/#{whoami}"
  folders = [ 'Space', 'Space/Kessel',
              'Space/Jedha', 'Space/Skarif' ]

  folders.each do |dir|
    folder = "#{home}/#{dir}"
    target "Create folder #{folder}"
    goto :localhost, :exec => "file #{folder}"
    expect [ folder, ': directory' ]
  end
end
