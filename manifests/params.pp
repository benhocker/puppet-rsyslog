class rsyslog::params {
    $rsyslog_server = $rsyslog_server ? {
        ''      => 'log',
        default => $rsyslog_server,
    }

    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $rsyslog_package_name = 'rsyslogr'
            $relp_package_name = 'rsyslog-relp'
            $rsyslog_d = '/etc/rsyslog.d/'
            $rsyslog_conf = '/etc/rsyslog.conf'
            $rsyslog_default = '/etc/default/rsyslog'
            $spool_dir = '/var/spool/rsyslog/'
            $service_name = 'rsyslog'
            $client_conf = "${rsyslog_d}client.conf"
            $server_conf = "${rsyslog_d}server.conf"
        }
    }
}
