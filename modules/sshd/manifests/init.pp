class sshd
{
    service { 'sshd':
        ensure => 'running',
    }

    file { '/etc/ssh/sshd_config':
        ensure  => 'present',
        owner   => 'root',
        group   => 'root',
        mode    => 0600,
        content => template("sshd/sshd_config.erb"),
    }
}
