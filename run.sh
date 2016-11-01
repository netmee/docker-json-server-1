#!/bin/bash

wget ‐O /data/db.json http://jsonplaceholder.typicode.com/db

args="$@"

args="$@ -p 80"

file=/data/db.json
if [ -f $file ]; then
    echo "Found db.json, trying to open"
    args="$args db.json"
fi

json-server $args
