group "Text files content" do
  readme "Rename every file."
  readme "Ensure exist text 'Rogue One' into every text file."

  whoami = `whoami`.chop
  dir = "/home/#{whoami}/characters"
  characters = [ 'jyn', 'casian', 'k2' ]

  characters.each do |name|
    file = "#{dir}/character/#{name}"
    target "Add content to ASCII text file #{file}"
    goto :localhost, :exec => "cat #{file}"
    expect 'Rogue One'
  end
end
