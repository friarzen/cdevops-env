class nginx
{
    package { 'nginx-light':
        ensure => 'installed',
    }

    file { '/var/www/html/index.nginx-debian.html'
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        mode   => 0644,
        content => template('nginx/templates/index.erb'),
    }
}
