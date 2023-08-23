#!/bin/bash

sudo mkdir -p /storage/docker-homol/deploy/gitlab/{data,logs,config}

sudo docker run -dit \
  -p "2221:22" \
  -p "3001:80" \
  -p "4001:443" \
  --name gitlab \
  --restart always \
  --hostname 192.168.15.70 \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest

# REFERENCIA: https://docs.gitlab.com/ee/install/docker.html
