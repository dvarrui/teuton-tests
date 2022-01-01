
group "Directories and files" do

  dirs=[ 'fuw', 'idp', 'lnd', 'lnt' ]

  dirs.each do |dirname|
    dirfullname = "/home/#{get(:username)}/Documentos/#{get(:domain)}/#{dirname}"
    target "Exist directory <#{dirfullname}>"
    run "vdir #{dirfullname} -d | wc -l", on: :host1
    expect result.eq(1)

    filefullname = "#{dirfullname}/leeme.txt"
    target "Exist file <#{filefullname}>"
    run "vdir #{filefullname} | wc -l", on: :host1
    expect result.eq(1)

    target "Content file <#{filefullname}> with <#{get(:username)}>"
    run "cat #{filefullname} | grep #{get(:username)}| wc -l", on: :host1
    expect result.eq(1)
  end
end
