#!/bin/bash

MANIFEST='keystore-deploy.yml'

function cleanup(){
    kubectl delete -f $MANIFEST
    docker rmi keystore-web
    docker rmi keysoter-ap
}

function createContainer(){
    mkdir -p /kubernetes/keystore
    docker build -t keystore-web web/
    docker build -t keystore-ap ap/
    kubectl apply -f $MANIFEST
    kubectl get pods --all-namespaces
}

function rerunContainer(){
    kebectl delete -f $MANIFEST
    kubectl apply -f $MANIFEST
}

function userguide(){
    echo -e "usage: ./run.sh [help | create | rerun | delete]"
    echo -e "
optional arguments:
create              Create image and container after that run the container.
rerun               Delete only container and rerun container with new settings.
delete              Delete image and container.
    "
}

function main(){
    [[ -z $1 ]] && { userguide; exit 1; }
    if [ $1 == "create" ]; then
        createContainer
    elif [ $1 == "rerun" ]; then
        rerunContainer
    elif [ $1 == "delete" ]; then
        cleanup
    elif [ $1 == "help" ]; then
        userguide
    else
        { userguide; exit 1; }
    fi
}

main $1
