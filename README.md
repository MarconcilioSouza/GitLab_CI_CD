# GitLab CI CD
Curso do Git Lab CI CD

##### Mostrar todas as imagem do docker 
    sudo docker images

##### Deletar todas as imagem do docker 
    sudo docker rmi -f $(sudo docker images -aq)

##### Para remover um container
    sudo docker container rm <container ID>

##### Remover o gitlab runner
    sudo gitlab-runner uninstall
    sudo rm -rf /usr/local/bin/gitlab-runner
    sudo userdel gitlab-runner
    sudo rm -rf /home/gitlab-runner/0
      
##### Start / Stop
    sudo gitlab-runner start
    sudo gitlab-runner stop

##### Mostrar os containner ativos 
    sudo docker ps -a


##### Acesso gitlab local
- http://localhost:80

#### Verificar os Logs do container
    sudo docker logs -f gitlab



##### Obter a senha root do git primeiro acesso
    sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
    usuário -> root

##### IP da maquina
    hostname -I

###### remover o Docker completamente do ubunto:

###### Step 1

    dpkg -l | grep -i docker
    To identify what installed package you have:

###### Step 2

    sudo apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin
    sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-compose-plugin

###### he above commands will not remove images, containers, volumes, or user created configuration files on your host. If you wish to delete all images, containers, and volumes run the following commands:

    sudo rm -rf /var/lib/docker /etc/docker
    sudo rm /etc/apparmor.d/docker
    sudo groupdel docker
    sudo rm -rf /var/run/docker.sock
###### You have removed Docker from the system completely.

##### Instalação do docker https://docs.docker.com/engine/install/ubuntu/

###### Visualizar a versão do docker
    docker --version
    docker-compose --version
    gitlab-runner --version

##### start gitlab-runner
    sudo systemctl restart gitlab-runner
##### adicionar enable para o gitlab-runner inicia junto com o SO
    sudo systemctl enable gitlab-runner

##### reiniciar o container
    sudo docker restart gitlab


###### Para evitar esses problemas de permissão, execute o seguinte comando => Got permission denied while trying to connect to the Docker daemon socket at
    sudo chmod 666 /var/run/docker.sock