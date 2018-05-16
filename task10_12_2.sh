#! /bin/bash
bash dockerinst.sh
bash docker-compose.sh
bash cert.sh
docker init
docker stack deploy mirantis -c docker-compose.yml
