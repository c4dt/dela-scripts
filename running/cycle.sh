#!/bin/bash

docker-compose kill dela-worker-1
docker-compose pull
docker-compose up -d
docker-compose logs -f --tail=100 dela-worker-1
