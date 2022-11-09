#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER vlad;
    CREATE DATABASE my_test;
    GRANT ALL PRIVILEGES ON DATABASE my_test TO vlad;
    
EOSQL

