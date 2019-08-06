
group "Cheking ACL assigned to /mnt/starwars/endor" do

  dir = '/mnt/starwars/endor'
  acls = [ 'user::rwx',
           'user:luke:r-x',
           'group:troopers:rwx',
           'mask::rwx',
           'other::---' ]

  target "root user is owner of #{dir} directory"
  goto :host1, :exec => "stat #{dir}"
  expect_one [ "Uid", "root" ]

  goto :host1, :exec => "getfacl #{dir}"

  acls.each do |line|
    target "Ensure directory #{dir} ACL includes <#{line}>"
    expect_one line
    result.restore!
  end
end

group "Checking ACL assigned to </mnt/starwars/xwing>" do
  dir = '/mnt/starwars/xwing'
  acls = [ 'user::rwx',
           'user:han:rwx',
           'user:luke:r-x',
           'group::---',
           'mask::rwx',
           'other::---' ]

  target "root user is owner of #{dir} directory"
  goto :host1, :exec => "stat #{dir}"
  expect_one [ "Uid", "root" ]

  goto :host1, :exec => "getfacl #{dir}"

  acls.each do |line|
    target "Ensure directory #{dir} ACL includes <#{line}>"
    expect_one line
    result.restore!
  end
end
