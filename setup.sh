#!/bin/bash

set -e

if ! [-x "$(command -v docker)"]; then
    echo "Docker nie jest zainstalowany. Instalacja Dockera :"
    sudo apt update
    sudo apt install -y docker.io
fi 

if ! [ -x "$(command -v docker-compose)"] then
    echo "Docker Compose nie jest zainstalowany. Instalacja Compose :"
    sudo apt update 
    sudo apt install -y docker-compose
fi 

if [ ! -d "project" ] then 
    git clone https://github.com/Jaro-DevOps/demo-bash-docker.git
    cd project 
else 
    cd project
fi

docker-compose up --build -d 

echo "### Aplikacja działa pod adresem http://localhost:5000"