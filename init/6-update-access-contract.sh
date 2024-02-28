#!/bin/bash

for id in $@; do
  docker-compose exec dela-worker-1 dvoting --config /data/node pool add\
      --key /data/node/private.key\
      --args go.dedis.ch/dela.ContractArg\
      --args go.dedis.ch/dela.Access\
      --args access:grant_id\
      --args 45564f54\
      --args access:grant_contract\
      --args go.dedis.ch/dela.Evoting \
      --args access:grant_command\
      --args all\
      --args access:identity\
      --args $id\
      --args access:command\
      --args GRANT
done

