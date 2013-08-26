class php {
	exec { "/usr/bin/apt-get update":
		command => "/usr/bin/apt-get update"
	}
	exec {
	  "composer":
	    command => "/usr/bin/curl -sS https://getcomposer.org/installer | php --install-dir=/vagrant"
	}

	package { 
	  "php5":
		ensure => latest,
		require => Exec["/usr/bin/apt-get update"];
	  "php5-mysql":
	    ensure  => present;
	  "mysql-client":
	    ensure  => present;
	  "composer":
	    ensure => present,
	    require => Exec["composer"];
	}
} 
