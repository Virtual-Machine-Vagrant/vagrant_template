group { 'puppet': ensure => present }
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
File { owner => 0, group => 0, mode => 0644 }

include main_setup
include apache2
include mysql::server
include php



mysql::server::db {
  "petertest":
  user => "peter",
  password => "petertest",
}
