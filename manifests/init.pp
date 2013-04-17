# Installs solr via Homebrew.
#
# Usage:
#
#     include solr
class solr {
  include solr::config
  include homebrew
  include java

  # Install our custom plist for nginx. This is one of the very few
  # pieces of setup that takes over priv. ports (80 in this case).
  file { '/Library/LaunchDaemons/dev.apache.solr.plist':
    content => template('solr/dev.apache.solr.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.apache.solr'],
    owner   => 'root'
  }

  # Set up all the files and directories solr expects.
  file { [
    $solr::config::logdir,
    $solr::config::datadir
  ]:
    ensure => directory
  }

  homebrew::formula { 'solr':
    before => Package['boxen/brews/solr']
  }

  package { 'boxen/brews/solr':
    ensure  => '4.2.0-boxen1',
    require => Class['java']
  }

  service { 'dev.apache.solr':
    ensure  => running,
    require => Package['boxen/brews/solr']
  }
}
