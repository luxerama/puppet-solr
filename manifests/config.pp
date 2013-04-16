class solr::config {
  require boxen::config

  $solrhome    = "${boxen::config::homebrewdir}/opt/solr/libexec/example"
  $configdir   =  "${solrhome}/multicore"
  $logdir      = "${boxen::config::logdir}/solr"
  $executable  = "${datadir}/start.jar"
}
