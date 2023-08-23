#!/bin/bash

# Ingressar o Runner em modo shell no GitLab
sudo gitlab-runner register -n \
  --url http://192.168.15.70:3001/ \
  --registration-token token \
  --executor shell \
  --description "Runner Shell"

# Criar o container gitlab-runner para Docker
sudo docker run -dit \
  --name runner-docker \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /opt/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:ubuntu-v14.9.1

# Ingressar o Runner em modo docker no GitLab
sudo docker exec -it runner-docker \
gitlab-runner register -n \
  --url https://gitlab.com/ \
  --registration-token token \
  --clone-url https://gitlab.com/ \
  --executor docker \
  --docker-image "docker:latest" \
  --docker-privileged

