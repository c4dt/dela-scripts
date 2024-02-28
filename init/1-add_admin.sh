#!/bin/bash

. .env
docker compose exec backend npx cli addAdmin --sciper "$REACT_APP_SCIPER_ADMIN";
docker compose exec backend npx cli addAdmin --sciper 987654;
docker compose restart backend;
