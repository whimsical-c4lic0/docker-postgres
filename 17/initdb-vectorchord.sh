#!/bin/bash

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Load VectorChord into $POSTGRES_DB
echo "Loading VectorChord extension into $DB"
"${psql[@]}" --dbname="$POSTGRES_DB" <<-'EOSQL'
	CREATE EXTENSION IF NOT EXISTS vchord CASCADE;
EOSQL

