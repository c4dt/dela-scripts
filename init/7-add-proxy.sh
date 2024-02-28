#!/bin/bash
. .env

curl -k "$FRONT_END_URL/api/get_dev_login/$REACT_APP_SCIPER_ADMIN" -c cookies.txt -o /dev/null -s
for i in $(seq 1 4); do
  curl -sk "$FRONT_END_URL/api/proxies/" -X POST -H 'Content-Type: application/json' -b cookies.txt --data "{\"NodeAddr\":\"https://node.dela-$i.c4dt.org:443\",\"Proxy\":\"https://proxy.dela-$i.c4dt.org\"}"
  echo - for proxy $i
done
