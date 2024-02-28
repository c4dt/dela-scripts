#!/bin/bash

for id in $@; do
  echo "ID is: $id"
  for node in $(seq 1); do
    docker compose exec "dela-worker-$node" dvoting --config /data/node access add --identity "$id"
  done
done

