class php {
	package { 
	  "php5":
	    ensure => latest;
	  "php5-mysql":
	    ensure  => present;
	  "mysql-client":
	    ensure  => present;
	  "php-codecoverage":
	    ensure => present;
	  "php-codesniffer":
	    ensure => present;
	  "phpunit":
	    ensure => present;
	  "php-pear":
	    ensure => present;
	}->
	exec {
	  "composer":
	    command => "/usr/bin/curl -sS https://getcomposer.org/installer | php --install-dir=/vagrant/www",
	    require => Package["php5"];
	  "phing":
	    command => "/usr/bin/pear channel-discover pear.phing.info && /usr/bin/pear install [--alldeps] phing/phing",
	    require => Package["php-pear"];
	}
} 
