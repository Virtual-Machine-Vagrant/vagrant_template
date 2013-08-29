class apache2 {
  package { "apache2":
    ensure => 'latest',
  }

  file { "/var/www":
    ensure => link,
    target => "/vagrant/www",
    force => true,
  }
}
