class mysql {
  # Define root mysql password.
  $mysqlpw = 'root'

  # Install mysql server
  package { 'mysql-server':
    ensure  => present,
    require => Exec['apt-get update']
  }

  # Start MySQL service.
  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }

  # Set mysql password.
  exec { 'set-mysql-password':
    unless  => "mysqladmin -uroot -p${mysqlpw} status",
    command => "mysqladmin -uroot password ${mysqlpw}",
    require => Service['mysql'],
  }
}
