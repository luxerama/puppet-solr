class solr::config {
  require boxen::config

  $solrhome    = "${boxen::config::homebrewdir}/opt/solr/libexec/example"
  $configdir   = "${solrhome}/multicore"
  $solrconfig  = "${configdir}/solr.xml"
  $datadir     = "${boxen::config::datadir}/solr"
  $logdir      = "${boxen::config::logdir}/solr"
  $executable  = "${solrhome}/start.jar"
}
