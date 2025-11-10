#!/bin/sh

curl http://127.0.0.1:6800/jsonrpc -H "Content-Type: application/json" -H "Accept: application/json" --data '{"jsonrpc": "2.0","id":1, "method": "aria2.pauseAll", "params":["token:6d9d9c41-9d82-4986-9e0c-6aa364167a42"]}'

exit 0

