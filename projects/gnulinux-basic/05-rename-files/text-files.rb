group "New text file names" do
  readme "Rename every file."
  readme "Ensure exist text 'Rogue One' into every text file."

  whoami = `whoami`.chop
  dir = "/home/#{whoami}/characters"
  characters = [ 'jyn.txt', 'casian.txt', 'k2.txt' ]

  characters.each do |name|
    file = "#{dir}/character/#{name}"
    target "Add content to ASCII text file #{file}"
    goto :localhost, :exec => "cat #{file}"
    expect 'Rogue One'
  end
end

group "Old text file names" do

  whoami = `whoami`.chop
  dir = "/home/#{whoami}/characters"
  characters = [ 'Jyn', 'Casian', 'K2-SO' ]

  characters.each do |name|
    file = "#{dir}/character/#{name}"
    target "Create ASCII text file #{file}"
    goto :localhost, :exec => "file #{file}"
    expect_none [ file, ': ASCII text' ]
  end
end
