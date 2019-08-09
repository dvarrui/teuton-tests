
group "ACL users and groups" do
  rebels = [ 'han', 'luke']
  troopers = [ 'trooper1', 'trooper2']

  rebels.each do |usuario|
    target "User <#{usuario}> is member of rebels group"
    goto :host1, :exec => "id #{usuario}"
    expect_one "rebels"
  end

  troopers.each do |usuario|
    target "User <#{usuario}> is member of troopers group"
    goto :host1, :exec => "id #{usuario}"
    expect_one "troopers"
  end
end
