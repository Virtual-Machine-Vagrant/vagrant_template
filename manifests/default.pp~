include main_setup
include apache2
include mysql::server
include php

$mysql_password = "secretkey"


mysql::server::db {
  "petertest":
  user => "peter",
  password => "petertest",
}
