#!/bin/bash

PASSWORD_FILE="/tmp/mysql_root_password.txt"

if [ -f "$PASSWORD_FILE" ]; then

    PASSWORD=$(<"$PASSWORD_FILE")

    echo "Accessed the Root password"

else

    echo "Password file does not exist: $PASSWORD_FILE"
    exit 1

fi

# Make the password available as an environment variable
export MYSQL_ROOT_PASSWORD="$PASSWORD"

exec /entrypoint.sh mysqld