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
	  "php5-sqlite":
	    ensure => present;
	  "php5-xdebug":
	    ensure => present;
	}->
	file { "/etc/php5/apache2/conf.d/20-xdebug.ini":
	  owner => "root", group => "root",
	  source => "puppet:///modules/php/xdebug.ini",
	  require => Package["php5-xdebug"],
	}->
	exec {
	  "composer":
	    creates => "/vagrant/www/composer.phar",
	    command => "curl -sS https://getcomposer.org/installer | php -- --install-dir=/vagrant/www",
	    require => Package["php5"];
	  "phing":
	    creates => "/usr/bin/phing",
	    command => "sudo pear channel-discover pear.phing.info && sudo pear install [--alldeps] phing/phing",
	    require => Package["php-pear"];
	}
} 
