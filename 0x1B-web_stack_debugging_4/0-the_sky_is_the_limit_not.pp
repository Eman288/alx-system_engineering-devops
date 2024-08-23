#Fixing the nginx server problem

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file { '/etc/nginx/nginx.conf':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => template('nginx/nginx.conf.erb'),
  notify  => Service['nginx'],
}

exec { 'tune-nginx':
  command => 'sed -i "s/worker_connections 768;/worker_connections 4096;/" /etc/nginx/nginx.conf',
  onlyif  => 'grep -q "worker_connections 768;" /etc/nginx/nginx.conf',
  notify  => Service['nginx'],
}

exec { 'restart-nginx':
  command     => '/etc/init.d/nginx restart',
  refreshonly => true,
  subscribe   => File['/etc/nginx/nginx.conf'],
}
