# GitLab_CI_CD
Curso do Git Lab CI CD

### Mostrar todas as imagem do docker 
- sudo docker images

### Deletar todas as imagem do docker 
- sudo docker rmi -f $(sudo docker images -aq)

### Remover o gitlab runner
- sudo gitlab-runner uninstall
- sudo rm -rf /usr/local/bin/gitlab-runner
- sudo userdel gitlab-runner
- sudo rm -rf /home/gitlab-runner/

### Instalando o gitlab-runner
- curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb"
- sudo dpkg -i gitlab-runner_amd64.deb

### Start / Stop
- sudo gitlab-runner start
- sudo gitlab-runner stop

### Mostrar os containner ativos 
- sudo docker ps -a

### Instalar o GitLab
´´´ 
    sudo mkdir -p /storage/docker-homol/deploy/gitlab/{data,logs,config}
    
    sudo docker run -dit \
      -p "2222:22" \
      -p "80:80" \
      -p "443:443" \
      --name gitlab \
      --hostname 192.168.15.70 \
      -v /storage/docker-homol/deploy/gitlab/data:/var/opt/gitlab \
      -v /storage/docker-homol/deploy/gitlab/logs:/var/log/gitlab \
      -v /storage/docker-homol/deploy/gitlab/config:/etc/gitlab \
      --shm-size 256m \
      gitlab/gitlab-ce:16.1.4-ce.0
´´´ 

### Acesso gitlab local
- http://192.168.15.70:80

### Obter a senha root do git primeiro acesso
- sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
- usuário -> root