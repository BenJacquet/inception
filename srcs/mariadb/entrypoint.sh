#! /bin/bash

sh initialize_db.sh &

exec mysqld_safe --user=root