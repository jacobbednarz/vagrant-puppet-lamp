class tools {
  # Package install list.
  $packages = [
    'curl',
    'vim',
    'htop'
  ]

  package { $packages:
    ensure  => present,
    require => Exec['apt-get update']
  }
}
