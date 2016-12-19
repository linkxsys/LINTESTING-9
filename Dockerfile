FROM alpine:3.4

RUN apk add --no-cache nginx php5-fpm php5-mcrypt php5-soap php5-openssl php5-gmp php5-pdo_odbc php5-json php5-dom php5-pdo php5-zip php5-mysql php5-mysqli php5-sqlite3 php5-apcu php5-pdo_pgsql php5-bcmath php5-gd php5-xcache php5-odbc php5-pdo_mysql php5-pdo_sqlite php5-gettext php5-xmlreader php5-xmlrpc php5-bz2 php5-memcache php5-mssql php5-iconv php5-pdo_dblib php5-curl php5-ctype openrc \
	&& adduser -D -u 1000 -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/php-fpm.conf /etc/php5/php-fpm.conf
ADD www /www
EXPOSE 80

#CMD ["/usr/bin/php-fpm", "--nodaemonize"]
#CMD ["nginx", "-g", "daemon off;"]
CMD /usr/sbin/nginx
