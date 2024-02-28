# Scripts for running d-voting

This is a repo with some bare scripts to show how to start, initialize, and handle nodes.
They are not at all prepared in any way but come straight from the server.

## Starting

To start the nodes, we use the following two docker-compose files:

- [docker-compose.yml](./docker/docker-compose.yml) for the backend, the frontend, and node #1
- [docker-compose-3nodes.yml](./docker/docker-compose-3nodes.yml) for the three nodes

All docker-compose files depend on a working traefik which is capable of handling the TLS connections
and forwards it to the nodes.
Please adjust the names in the docker-compose files and in the `.env` to correctly reflect your infra.

In addition, the nodes need a `.env` file, which is similar to [env.example](docker/env.example).
Look at the `env.example` file for more information.

## Initializing

To initialize, I use a couple of scripts in the [init](./init) directory:

- [1-add_admin.sh](init/1-add_admin.sh) run only on the backend/frontend server.
It initializes the authorization management system
- [2-export-key.sh](init/2-export-key.sh) run on all workers
- [3-setup-members.sh](init/3-setup-members.sh) run on dela-worker-1.
Put all the keys from `2-export-key.sh` as arguments
- [4-get-identity.sh](init/4-get-identity.sh) run on all workers
- [5-authorize-identities.sh](init/5-authorize-identities.sh) run on all workers.
Put all the identities from `4-get-identity.sh` as arguments
- [6-update-access-contract.sh](init/6-update-access-contract.sh) run on dela-worker-1.
Put all the identities from `4-get-identity.sh` as arguments
- [7-add-proxy.sh](init/7-add-proxy.sh) run only on frontend server

## Running nodes

As all the `docker-compose` files store the data in the `data/` directories, there are some
simple scripts to handle that data:

- [save.sh](running/save.sh) takes a word as argument, stops docker, copies `data` to `data.$1`
- [reset.sh](running/reset.sh) takes a word as argument, stops docker, deletes `data`, copies `data.$1` to `data`
and restarts docker
- [cycle.sh](running/cycle.sh) stops docker, pulls updates for images, and starts docker

# License

This is all licensed under an MIT license.

(c) 2024 by C4DT.epfl.ch