class php::pear {
  include php

  # Upgrade PEAR.
  exec { 'pear upgrade':
    require => Package['php-pear']
  }

  exec { 'pear config-set auto_discover 1':
    require => Exec['pear upgrade']
  }

  # Create PEAR temp directory for channel-add.
  file { '/tmp/pear/temp':
    ensure  => 'directory',
    require => Exec['pear config-set auto_discover 1'],
    owner   => 'root',
    group   => 'root',
    mode    => '0777'
  }

  # Discover channels.
  exec { 'pear channel-discover pear.phpunit.de; true':
    require => [
      File['/tmp/pear/temp'],
      Exec['pear config-set auto_discover 1']
    ]
  }

  exec { 'pear channel-discover pear.symfony-project.com; true':
    require => [
      File['/tmp/pear/temp'],
      Exec['pear config-set auto_discover 1']
    ]
  }

  exec { 'pear channel-discover components.ez.no; true':
    require => [
      File['/tmp/pear/temp'],
      Exec['pear config-set auto_discover 1']
    ]
  }

  # Clear cache before install PHPUnit.
  exec { 'pear clear-cache':
    require => [
      Exec['pear channel-discover pear.phpunit.de; true'],
      Exec['pear channel-discover pear.symfony-project.com; true'],
      Exec['pear channel-discover components.ez.no; true']
    ]
  }

  # Install PHPUnit.
  exec { 'pear install -a -f phpunit/PHPUnit':
    require => Exec['pear clear-cache']
  }
}
