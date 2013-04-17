class solr::config {
  require boxen::config

  $solrhome    = "${boxen::config::homebrewdir}/opt/solr/libexec/example"
  $configdir   = "${solrhome}/multicore"
  $datadir     = "${boxen::config::datadir}/solr"
  $logdir      = "${boxen::config::logdir}/solr"
  $executable  = "${datadir}/start.jar"
}
