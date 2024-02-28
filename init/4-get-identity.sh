#!/bin/bash

for signer in $(seq 1); do
  docker compose exec "dela-worker-$signer" crypto bls signer read --path /data/node/private.key --format BASE64_PUBKEY;
done

