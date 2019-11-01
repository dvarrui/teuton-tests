group "Text files content" do
  readme "Add text 'Rogue One' into every text file."

  whoami = `whoami`.chop
  dir = "/home/#{whoami}/characters"
  characters = [ 'Jyn', 'Casian', 'K2-SO' ]

  characters.each do |name|
    file = "#{dir}/character/#{name}"
    target "Add content to ASCII text file #{file}"
    goto :localhost, :exec => "cat #{file}"
    expect 'Rogue One'
  end
end
