#!/bin/bash

docker-compose exec dela-worker-1 /bin/bash -c 'LLVL=error dvoting --config /data/node ordering export'
