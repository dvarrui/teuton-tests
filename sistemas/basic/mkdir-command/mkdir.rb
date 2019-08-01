
group :directory_and_files_created do
  dirs=[ 'fuw', 'idp', 'lnd', 'lnt' ]

  dirs.each do |dirname|
    dirfullname="/home/#{get(:firstname)}/Documentos/curso1516/#{dirname}"
    target "Exist directory <#{dirfullname}>"
    goto  :host1, :exec => "vdir #{dirfullname} -d | wc -l"
    expect result.eq(1)

    filefullname="#{dirfullname}/leeme.txt"
    target "Exist file <#{filefullname}>"
    goto  :host1, :exec => "vdir #{filefullname} | wc -l"
    expect result.eq(1)

    target "Content file <#{filefullname}> with <#{get(:firstname)}>"
    goto  :host1, :exec => "cat #{filefullname} | grep #{get(:firstname)}| wc -l"
    expect result.eq(1)
  end
end
