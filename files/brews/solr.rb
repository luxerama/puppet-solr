require 'formula'

class Solr < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://www.apache.org/dyn/closer.cgi?path=lucene/solr/4.2.0/solr-4.2.0.tgz'
  sha1 '3525a424be3c7f5de27ea1ab60b267cc0670b6c4'

  version '4.2.0-boxen1'

  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end

  def install
    libexec.install Dir['*']
    (bin+'solr').write script
  end
end
