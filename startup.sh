#!/usr/bin/env bash

: "${MONGO_HOST:=mongo}"
: "${MONGO_PORT:=27017}"

echo "Waiting database to start... ($MONGO_HOST:$MONGO_PORT)"

./wait-for-it.sh --timeout=0 $MONGO_HOST:$MONGO_PORT

echo "Database started, operations are continuing..."

eval "$*"
