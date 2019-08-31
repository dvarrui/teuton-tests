
group "Install sofware" do
  packagename = "tlsp"
  target "Install package #{packagename}"
  goto :host1, :exec => "dpkg -l #{packagename}"
  expect_one "ii"

  target "Build image"
  goto :host1, :exec => "ltsp-info"
  expect_one 'found image'

  goto :host1, :exec => "ltsp-info| grep 'found image'| tr -s ':' ' '|tr -s ' ' ':'| cut -d : -f 3"
  log "imagefullname = #{result.value}"
end

group "Run the services" do
  services = [ 'dhcpd', 'tftpd' ]

  services.each do |service|
    target "Run service #{service}."
    goto :host1, :exec => "ps -ef | grep -v color"
    expect_one service
  end

  filename = '/etc/default/isc-dhcp-server'
  target "Define INTERFACES=eth1 into #{filename}."
  goto :host1, :exec => "cat #{filename}"
  expect_one [ 'INTERFACES="eth1"' ]

  filename = '/etc/default/tftpd-pha'
  target "Define TFTP_ADDRESS as 192.168.0.1:69 into #{filename}."
  goto :host1, :exec => "cat #{filename}"
  expect_one 'TFTP_ADDRESS="192.168.0.1:69"'
end
