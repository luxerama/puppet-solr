# SOLR Puppet Module for Boxen

## Usage

```puppet
include solr
```

### Search index type usage
```puppet
searchindex { "test":
      name       => "test",
      provider   => solr,
      configfile => /abs/path/to/config.xml,
      notify     => Service['dev.apache.solr'],
      require    => Package['boxen/brews/solr'];
    }
```

## Required Puppet Modules

* boxen
* homebrew
* java
* stdlib
