class apache2 {
  package { 'apache2':
    ensure  => present,
    require => Exec['apt-update'],
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'],
  }

  file { 'default virtualhost':
    path    => '/etc/apache2/sites-available/default',
    ensure  => present,
    content => "\
<VirtualHost *:80>
  DocumentRoot /vagrant/web
  ServerName localhost

  <Directory />
    Options FollowSymLinks
    AllowOverride None
  </Directory>

  <Directory /vagrant/web>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    allow from all
  </Directory>

  ErrorLog /var/log/apache2/error.log
  LogLevel warn
  CustomLog /var/log/apache2/access.log combined
  ServerSignature Off
</VirtualHost>",
    require => Package['apache2'],
    notify  => Service['apache2'],
    mode    => 644,
  }
}
