case $operatingsystem {
  debian, ubuntu: { $ntpserver = 'ntpd' }
  centos: { $ntpserver = 'ntp' }
}

package { $ntpserver:
  ensure => present,
  before => File['/etc/ntp.conf'],
}

file { '/etc/ntp.conf':
  ensure => file,
  mode   => 644,
  source => $operatingsystem ? {
    /(debian,ubuntu)/ => '/root/learning-manifests/ntp.conf.debian',
    centos => '/root/learning-manifests/ntp.conf.el',
  },
}

service { 'ntpd':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  subscribe  => File['/etc/ntp.conf'],
}
