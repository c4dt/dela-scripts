#!/bin/bash

echo Arguments are: $@
MEMBERS=""
for m in $@; do
	echo "Adding member $m"
	MEMBERS="$MEMBERS --member $m"
done
docker compose exec dela-worker-1 dvoting --config /data/node ordering setup $MEMBERS

