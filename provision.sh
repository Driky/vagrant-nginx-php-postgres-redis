# add repos for latest php, nginx & redis
sudo add-apt-repository -y ppa:nginx/stable
sudo add-apt-repository -y ppa:ondrej/php5
sudo add-apt-repository -y ppa:rwky/redis

# base
sudo apt-key update
sudo apt-get update
sudo apt-get install -y vim curl wget build-essential python-software-properties

# nginx
sudo apt-get install -y nginx

# php
sudo apt-get install --force-yes -y php5 php5-cli php5-curl php5-gd php5-mcrypt php5-xdebug php5-pgsql php5-fpm php5-redis phpunit

# php-fpm config
sudo sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini
sudo chown www-data:www-data /var/run/php5-fpm.sock
sudo service php5-fpm restart

# composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version

# nginx config
sudo rm -f /etc/nginx/sites-enabled/default
sudo rm -f /etc/nginx/sites-enabled/primedia
sudo ln -s /vagrant/server /etc/nginx/sites-enabled/primedia
sudo service nginx restart

# redis
sudo apt-get install -y redis-server

# postgres
sudo apt-get install -y postgresql postgresql-contrib

POSTGRE_VERSION=9.3

# listen for localhost connections
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/$POSTGRE_VERSION/main/postgresql.conf

# identify users via "md5", rather than "ident", allowing us to make postgres
# users separate from system users. "md5" lets us simply use a password
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/$POSTGRE_VERSION/main/pg_hba.conf
sudo service postgresql start

# create new user "root" with defined password "root" not a superuser
sudo -u postgres psql -c "CREATE ROLE root LOGIN UNENCRYPTED PASSWORD 'root' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;"

# create new database "database"
sudo -u postgres psql -c "CREATE DATABASE database"

sudo service postgresql restart
