#!/usr/bin/bash

errmsg="ERROR! usage: $0 directory container_name version dockerhub_repo_name"

directory=${1?$errmsg}
name=${2?$errmsg}
version=${3?$errmsg}
dockerhubrepo=${4?$errmsg}

docker build -f $directory/Dockerfile -t $name:$version .
docker tag $name:$version $dockerhubrepo/$name:$version
docker push $dockerhubrepo/$name:$version
