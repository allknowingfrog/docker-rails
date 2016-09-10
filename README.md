# docker-rails

## Summary
This is a Docker-based environment for developing Ruby on Rails via the Linux terminal and Vim.

## Docker Setup

### Clone repo
`git clone git@github.com:allknowingfrog/rails-docker.git`

### To build the initial docker image
Navigate into the repository directory and, if desired, edit bashrc and vimrc with your desired settings. While still inside the repository directory, build the Docker image with this command:

`sudo docker build -t rails .`

This will name the new image "rails" but you can choose anything you prefer.

Note that Docker images and containers exist independent of the directories from which they are created, so the remaining commands can be run from anywhere.

### To create a container from the built image
User `docker run` to create a new container. The `-d` flag causes the container to run in the background, while `-p` and `-v` map ports and volumes, respectively. Mounting a volume causes it to be shared between the local machine and the container (changes in one will be reflected in the other). In this example, we're using the "rails" image created in the previous step and naming our new container "rails-server".

`sudo docker run -d --name rails-server -p 22:22 -p 3000:3000 -v ~/local/file/path:/container-file-path rails`

### To ssh into container
Connecting to the container from a terminal is just like accessing any remote machine. Note that the default password is set to "guest" in the Dockerfile.

`ssh root@localhost`

### To stop the container
Stopped containers maintain their state and can be started again to resume work.

`sudo docker stop rails-server`

### To start a stopped container
`sudo docker start rails-server`

### To see all containers
`sudo docker ps -a`
