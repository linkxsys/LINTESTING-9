#!/bin/sh
set -e
sed -i "s|\$username = [^;]*|\$username = \"$USERNAME\"|g" /www/mysql.php
sed -i "s|\$servername = [^;]*|\$servername = \"$SERVERNAME\"|g" /www/mysql.php
sed -i "s|\$password = [^;]*|\$password = \"$PASSWORD\"|g" /www/mysql.php

nginx -g "daemon off;" & php-fpm --nodaemonize
