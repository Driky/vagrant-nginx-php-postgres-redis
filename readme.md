## Vagrant Shell Provisioner

A basic shell provisioner for vagrant which installs the following:

- Ubuntu 14.04 LTS
- NGINX 1.6.0
- PHP 5.5
- Postgres 9.3
- Composer
- SQLite
- Redis
- [linux-dash](https://github.com/afaqurk/linux-dash)

### Installation

```bash
git clone git@github.com:wayneashleyberry/vagrant-nginx-php-postgres-redis.git
composer install --no-interaction --working-dir source
vagrant up
```

### Laravel

This project contains a Laravel 4.1 installation with a few test routes to
check if everything's installed and working. Check out the vagrant environment
and config to see database and caching server credentials.

[Clockwork](https://github.com/itsgoingd/clockwork) is also included as
a dependency.

### Linux Dash

[linux-dash](https://github.com/afaqurk/linux-dash) is installed separately and
runs on port 90, which should be forwarded to 9090.
