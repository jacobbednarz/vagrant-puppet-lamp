class bootstrap {
  # Silence puppet and vagrant annoyance about the puppet group.
  group { 'puppet':
    ensure => 'present'
  }

  # Ensure local apt cache index is up to date before beginning.
  exec { 'apt-get update':
    command => 'apt-get update --fix-missing'
  }
}
