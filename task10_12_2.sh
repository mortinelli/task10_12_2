#! /bin/bash
bash dockerinst.sh
bash docker-compouse.sh
bash cert.sh
docker init
docker stack deploy mirantis -c docker-compose.yml
