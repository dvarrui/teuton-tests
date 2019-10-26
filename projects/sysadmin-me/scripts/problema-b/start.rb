
group "Problema B" do

  hosts = [ "google.es", "aprendeaprogramar.org",
            "programa-me.com","marca.es" ]

  hosts.each do |host|
    target "Resolver nombre de dominio #{host}."
    run "host #{host}"
    expect 'has address'
  end

end

play do
  show
  export
end
