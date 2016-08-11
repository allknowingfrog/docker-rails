#rails-docker

##Summary

This is a minimal Docker setup for developing Rails via Vim and the command-line.

##Installation

After installing Docker and cloning this repository...

Navigate into the repository directory and, if desired, replace bashrc and vimrc with your desired settings. While still inside the repository directory, build the Docker image with this command:

```sudo docker build -t rails .```

This will name the new image 'rails' but you can tag it however you like.

Docker images and containers exist independent of the directories from which they are created, so the following commands can be run from anywhere.

This command will create a new container and enter a bash shell within it:

```sudo docker run -it -p 3000:3000 -v ~/src:/src rails bash```

The `-it` flags create an interactive session, while `-p` and `-v` map ports and volumes, respectively. Mounting a volume causes it to be shared between the local machine and the container (changes in one will be reflected in the other). `rails` is the image name and `bash` is the command to execute inside the container.

After a potentially-lengthy installation process, you'll enter a bash shell inside the new container. Exit the container with the normal `exit` command. After exiting, this container will continue to exist with all of its settings. You can view all existing containers with `sudo docker ps -a`. You can restart your container with this command:

```sudo docker start -i happy_archimedes```

Containers are automatically tagged at creation. Replace `happy_archimedes` with the appropriate tag name.

Note that Git commands and other text editors can be used to interact with files mounted via the `-v` flag.
