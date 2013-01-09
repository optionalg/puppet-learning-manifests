case $operatingsystem {
  centos: { $buildtools = [ 'gcc' ] }
  debian, ubuntu: { $buildtools = [ 'gcc', 'build-essential' ] }
}

package { $buildtools:
  ensure => present,
}
