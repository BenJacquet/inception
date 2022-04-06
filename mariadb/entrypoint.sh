#! /bin/bash

FILE=/.first_run
if [ ! -f $FILE ]; then
    touch $FILE
    echo "-- First container startup -- Proceding to initialization and injection"
    sh initialize_db.sh &
else
    echo "-- Not first container startup -- Ignoring initialization and injection"
fi

exec mysqld_safe