case $operatingsystem {
  centos: { $apache = 'httpd' }
  debian, ubuntu: { $apache = 'apache2' }
  default: { fail("Unknown OS") }
}

package { $apache:
  ensure => installed,
}

service { $apache:
  ensure => running,
  enable => true,
}
