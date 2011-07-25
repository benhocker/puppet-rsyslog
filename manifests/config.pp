class rsyslog::config {
    file { $rsyslog::params::rsyslog_d:
        owner   => root,
        group   => root,
        purge   => true,
        recurse => true,
        force   => true,
        require => Class["rsyslog::install"],
        ensure  => directory,
    }

    file { $rsyslog::params::rsyslog_conf:
        owner   => root,
        group   => root,
        ensure  => file,
        source  => "puppet:///modules/rsyslog/rsyslog.conf",
        require => Class["rsyslog::install"],
        notify  => Class["rsyslog::service"],
    }

    file { $rsyslog::params::rsyslog_default:
        owner   => root,
        group   => root,
        ensure  => file,
        source  => "puppet:///modules/rsyslog/rsyslog_default",
        require => Class["rsyslog::install"],
        notify  => Class["rsyslog::service"],
    }

    file { $rsyslog::params::spool_dir:
        owner   => root,
        group   => root,
        ensure  => directory,
        require => Class["rsyslog::install"],
        notify  => Class["rsyslog::service"],
    }
}
