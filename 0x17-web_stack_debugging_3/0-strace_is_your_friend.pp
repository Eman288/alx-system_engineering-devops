# fixing the 500 error

file { '/var/www/missing_directory':
  ensure => 'directory',
  owner  => 'www-data',
  group  => 'www-data',
  mode   => '0755',
}

service { 'apache2':
  ensure     => 'running',
  enable     => true,
  subscribe  => File['/var/www/missing_directory'],
}
