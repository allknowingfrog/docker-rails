# docker-rails

## Summary
This is a Docker-based environment for developing Ruby on Rails.

## Docker Setup

### Clone repo
`git clone git@github.com:allknowingfrog/docker-rails.git`

### To build the initial docker image
Navigate into the repository directory and, if desired, replace bashrc and vimrc with your preferred settings. While still inside the repository directory, build the Docker image with this command:

`sudo docker build -t rails .`

This will name the new image "rails" but you can choose anything you like.

Note that Docker images and containers exist independent of the directories from which they are created, so the remaining commands can be run from anywhere.

### To create a container from the new image
`sudo docker run -it --name rails-server -p 3000:3000 -v ~/local/file/path:/container-file-path rails bash`

The `-it` flags create an interactive session, while `-p` and `-v` map ports and volumes, respectively. Mounting a volume causes it to be shared between the local machine and the container (changes in one will be reflected in the other). Note that Git commands and other text editors can be used to interact with files mounted via the `-v` flag. The `--name` flag tags the new container, `rails` is the image to use and `bash` is the command to execute inside the container.

### To stop the container
Stopped containers maintain their state and can be started again to resume work.

`sudo docker stop rails-server`

### To start the stopped container
`sudo docker start -i rails-server`

### To see all containers
`sudo docker ps -a`

### To enter a new bash shell in a running container (from a separate terminal)
`sudo docker exec -it rails-server bash`
