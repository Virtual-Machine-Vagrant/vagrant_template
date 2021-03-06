class mysql::server {
  package {
    "mysql-server": ensure => installed 
  }->
  file { "/etc/mysql/my.cnf":
    owner => "mysql", group => "mysql",
    source => "puppet:///modules/mysql/my.cnf",
    require => Package["mysql-server"],
  }->
    service { "mysql":
    enable => true,
    ensure => running,
    subscribe => File["/etc/mysql/my.cnf"],
    require => Package["mysql-server"],
  }
  define db( $user, $password ) {
    if Exec["set-mysql-password"] {
      exec { "create-${name}-db":
	unless => "mysql -u${user} -p${password} ${name}",
	command => "mysql -uroot -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password'; flush privileges;\"",
	require => [Service["mysql"]],
      }
    }
  }
}