$package =[
        'openvpn',
        'network-manager-openvpn',
        'network-manager-openvpn-gnome'
]

$user = [
        'bmo.office.reliab.tech'
]

#exec { 'apt-install':
#	command => '/usr/bin/sudo apt-get install openvpn network-manager-openvpn network-manager-openvpn gnome',
#}
package { $package:
        ensure => present,
#	user => root
}
#service { openvpn:
#       provider => service,
#       enable => true
#}
#exec { 'sample':
#       path => ['/usr/bin', '/usr/sbin', '/bin'],
#       command => 'systemctl enable openvpn'
#
#}
node 'ubunta02.office.reliab.tech' {
        file {
		'/tmp/puppetCerts':
		ensure => directory;
                '/tmp/puppetCerts/dyadichkin.aa.pem':
                ensure => file,
                content => file('/etc/puppet/serverFiles/certs/dyadichkin.aa.pem');
                '/tmp/puppetCerts/dyadichkin.aa.crt':
                ensure => file,
                content => file('/etc/puppet/serverFiles/certs/dyadichkin.aa.crt');
                '/tmp/puppetCerts/Reliability_Technologies_OpenVPN_CA.crt':
                ensure => file,
                content => file('/etc/puppet/serverFiles/certs/Reliability_Technologies_OpenVPN_CA.crt');
                '/etc/NetworkManager/system-connections/RT_VPN':
                ensure => file,
                content => file('/etc/puppet/serverFiles/certs/RT_VPN')
        }
}
service { 'network-manager':
        ensure => true
}
#        exec {
#               'Reload connection':
#               path => ['/usr/bin'],
#               command => 'sudo /usr/bin/nmcli connection reload'
#      }
