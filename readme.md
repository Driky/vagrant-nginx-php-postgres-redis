## Vagrant Shell Provisioner

A basic shell provisioner for vagrant which installs the following:

- Ubuntu 14.04 LTS
- NGINX
- PHP 5.5
- Composer
- Postgres 9.3
- Redis

### Installation

```bash
git clone git@github.com:wayneashleyberry/linux.git
composer install --no-interaction --working-dir source
vagrant up
```

### Laravel

This project contains a Laravel 4.1 installation with a few test routes to
check if everything's installed and working.
