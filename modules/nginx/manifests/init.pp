class nginx
{
    package { ['nginx-light', 'ssl-cert']:
        ensure => 'installed',
    }

    file { '/etc/nginx/sites-available/default':
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        mode   => 0644,
        content => template('nginx/default.erb'),
        require => Package['nginx-light'],
    }

    file { '/var/www/html/index.nginx-debian.html':
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        mode   => 0644,
        content => template('nginx/index.erb'),
        require => File['/etc/nginx/sites-available/default'],
    }

    service { 'nginx':
        ensure => 'running',
        require => File['/var/www/html/index.nginx-debian.html'],
    }
}
