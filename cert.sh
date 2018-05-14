#! /bin/bash 
source config

mkdir certs
apt-get install openssl -y -qq

openssl genrsa -out certs/root.key 4096
openssl req -new -key certs/root.key -days 365 -nodes -x509 \
    -subj "/C=UA/ST=Kharvovskaya obl./L=Kharkov/O=Mirantis Matveev/CN=RootCA" \
    -out certs/root.crt

curdir=$(pwd)
openssl genrsa -out certs/web.key 4096

openssl req -new -key certs/web.key \
    -subj "/C=UA/ST=Kharvovskaya obl./L=Kharkov/O=Mirantis Matveev/CN=$HOST_NAME" \
    -reqexts SAN \
    -config <(cat /etc/ssl/openssl.cnf \
        <(printf "\n[SAN]\nsubjectAltName=IP:$EXTERNAL_IP")) \
    -out certs/web.crt


openssl x509 -req -extfile <(printf "subjectAltName=IP:$EXTERNAL_IP") \
        -days 365\
        -CA certs/root.crt \
        -CAkey certs/root.key -CAcreateserial \
        -in certs/web.crt\
        -out certs/web.crt

cat certs/root.crt >> certs/web.crt
