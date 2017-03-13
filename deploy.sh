#!/bin/bash
docker push yusupov/sample-node

ssh yusupovtestmail@104.199.107.164
docker pull yusupov/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi yusupov/sample-node:current || true
docker tag yusupov/sample-node:latest yusupov/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 yusupov/sample-node:current
