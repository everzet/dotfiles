class mysql {
  package { 'mysql-server':
    ensure  => present,
    require => Exec['apt-update'],
  }

  package { 'php5-mysql':
    ensure  => present,
    require => Package['php5'],
    notify  => Service['apache2'],
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }
}
