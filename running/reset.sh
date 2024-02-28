#!/bin/bash

if [[ "$1" == "" || ! -d data.$1 ]]; then
	ls -d data*
	exit 1
fi

docker-compose down
docker-compose pull
sudo rm -rf data
sudo cp -a data.$1 data
docker-compose up -d
docker-compose logs -f --tail=1000 dela-worker-1
