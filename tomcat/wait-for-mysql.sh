#!/bin/bash
set -e

host="$1"
shift
cmd="$@"

while ! mysqladmin ping -h "$host" -P 3306 -u root -p "$MYSQL_ROOT_PASSWORD" --silent; do
    >&2 echo "Connecting: ping -h $host -P 3306 -u root -p $MYSQL_ROOT_PASSWORD"
    >&2 echo "MySQL is unavailable - sleeping"
    sleep 2
done


>&2 echo "MySQL is up - executing command"
exec $cmd