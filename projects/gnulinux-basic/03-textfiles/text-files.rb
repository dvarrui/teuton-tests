group "ASCII text files" do

  whoami = `whoami`.chop
  dir = "/home/#{whoami}/characters"
  characters = [ 'Jyn', 'Casian', 'K2-SO' ]

  characters.each do |name|
    file = "#{dir}/character/#{name}"
    target "Create ASCII text file #{file}"
    goto :localhost, :exec => "file #{file}"
    expect [ file, ': ASCII text' ]
  end
end
