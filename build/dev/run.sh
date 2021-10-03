#!/bin/bash

# Change variables below if you need
##############################
NAME="keystore"
DOCKERHUBUSER="tuimac"
IMAGE=${DOCKERHUBUSER}/${NAME}
##############################

function runContainer(){
    docker-compose up -d
}

function cleanup(){
    docker image prune -f
    docker container prune -f
}

function createContainer(){
    runContainer
    cleanup
}

function deleteAll(){
    docker-compose down
    docker rmi ${NAME}
    cleanup
    sudo rm -rf data/
}

function userguide(){
    echo -e "usage: ./run.sh [help | create | delete]"
    echo -e "
optional arguments:
create              Create image and container after that run the container.
delete              Delete image and container.
    "
}

function main(){
    [[ -z $1 ]] && { userguide; exit 1; }
    if [ $1 == "create" ]; then
        createContainer
    elif [ $1 == "delete" ]; then
        deleteAll
    elif [ $1 == "help" ]; then
        userguide
    elif [ $1 == "register-secret" ]; then
        registerSecret
    else
        { userguide; exit 1; }
    fi
}

main $1
