yum docker update
yum docker inatall
``

### Create Context between Clinent and server
docker context create --docker-server _ServerDetails with sh

### List docker context
docker context ls

### Set created context
docker context use _context_name

### Load images from the docker registery
docker pull python docker pull openjdk docker pull alpine

### inspect the details of docker image
docker inspet _image name

### delete the images
docker rmi _image_name

### listing docker images 
docker images


### create container from the images
docker run -itd --name _container_name _image_name

### check the status of running docker
docker ps 

### inspect the details of container
docker inspect _dockername

### create the network
docker network create _IP_with_subnetmask

### create the volume 
docker volume create 

### different docker run command options 
#### to map port to runnign container 
-p _container_port:_docker_host_port

#### to set external volume to save data
-v vlumename_created_host:_path_from_created_container

### to access the terminal from running container 
docker exec -it _contaienr_name sh

### check the logs of running container
docker logs _container_name

### push changes to docker regitstery 
docker tag _image_name _tag_name_with_registere_server

### docker login

### docker push

### remove container
docker rm _contaiername

### Stop the container
docker stop _container_name

### start the contaienr
docker start _container_name

### pasue the container
docker pause _container_name

### restarr from pause
docker restart _container_name

### container restart policy 
--restart no/alwasys/unless_stopped
