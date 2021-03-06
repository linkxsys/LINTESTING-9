FROM alpine:3.4

RUN apk add --no-cache nginx php5-fpm php5-mcrypt php5-soap php5-openssl php5-gmp php5-pdo_odbc php5-json php5-dom php5-pdo php5-zip php5-mysql php5-mysqli php5-sqlite3 php5-apcu php5-pdo_pgsql php5-bcmath php5-gd php5-xcache php5-odbc php5-pdo_mysql php5-pdo_sqlite php5-gettext php5-xmlreader php5-xmlrpc php5-bz2 php5-memcache php5-mssql php5-iconv php5-pdo_dblib php5-curl php5-ctype openrc \
	&& adduser -D -u 1000 -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

COPY files /
RUN chmod 755 /start.sh
EXPOSE 80
ENV USERNAME lintesting
ENV SERVERNAME lintesting.c8fsyuyj8qws.us-east-1.rds.amazonaws.com
ENV PASSWORD ebfa5cf69b

ENTRYPOINT ["/start.sh"]
