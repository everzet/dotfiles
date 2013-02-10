class mysql {
  package { 'php5-mysql':
    ensure  => present,
    require => Package['php5'],
    notify  => Service['apache2'],
  }
}
