#!/bin/bash

if [[ "$1" == "" ]]; then
        echo "Please give label"
        exit 1
fi

docker-compose down
sudo rm -rf data.$1
sudo cp -a data data.$1

