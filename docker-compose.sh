#! /bin/bash
source config

exec 1> docker-compose.yml
echo "version: '3.3'                            "
echo "services:                                 "
echo "  nginx:                                  "
echo "    image: $NGINX_IMAGE                   "
echo "    networks:                             "
echo "      - mirantis                          "
echo "    ports:                                "
echo "      - $NGINX_PORT:443                   "
echo "    hostname: nginx                       "
echo "    volumes:                              "
path=$(pwd)
echo "      - $path/etc:/etc/nginx"
echo "      - $path/certs/:/etc/nginx/certs"
echo "      - $path/$NGINX_LOG_DIR:/var/log/nginx/"
echo "    deploy:                               "
echo "      replicas: 1                         "
echo "      restart_policy:                     "
echo "        condition: any                    "
echo "        delay: 5s                         "
echo ""
echo "  httpd:                                  "
echo "    image: $APACHE_IMAGE                  "
echo "    networks:                             "
echo "      - mirantis                          "
echo "    hostname: httpd                       "
echo "    deploy:                               "
echo "      replicas: 1                         "
echo "      restart_policy:                     "
echo "        condition: any                    "
echo "        delay: 5s                         "
echo ""
echo "networks:                                 "
echo "  mirantis:                               "
echo "    driver: overlay "

