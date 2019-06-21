# docker-rails

## Summary
This is a Docker-based environment for developing Ruby on Rails.

## Setup

### Clone the repo
```
git clone git@github.com:allknowingfrog/docker-rails.git
```

### To build the initial docker image
Navigate into the repository directory and build the Docker image with this command:

```
sudo docker build -t rails .
```

This will name the new image "rails", but you can choose anything you like.

Note that Docker images and containers exist independent of the directories from which they are created, so the remaining commands can be run from anywhere. You can build multiple containers from the same image. You only need to rebuild if you change something in the Dockerfile.

### To create a container from the new image
```
sudo docker run -it --name rails_server -p 3000:3000 -v ~/local/file/path:/container-file-path rails
```

The `-it` flags create an interactive session, while `-p` and `-v` map ports and volumes, respectively. Mounting a volume causes it to be shared between the local machine and the container (changes in one will be reflected in the other). Note that Git commands and other text editors can be used to interact with files mounted via the `-v` flag. The `--name` flag tags the new container and `rails` is the image to use.

### To create a container with a database

You won't get very far in Rails without a database. You can install SQLite via the Dockerfile or in the container to use the Rails defaults. Alternatively, you may want to create and link to a database container. Here's an example for setting up PostgreSQL.

First, create a network to link the containers
```
sudo docker network create foo
```

Then, create the database container on the network
```
sudo docker run -d --name foo_postgres --network=foo --network-alias=db -e POSTGRES_PASSWORD=guest postgres
```

Finally create the Rails container on the same network

```
sudo docker run -it --name foo_rails -p 3000:3000 -v ~/local/file/path:/container-file-path --network=foo rails
```

In this example, you'll want to use the `-d` flag with `rails new` to set up your database, i.e. `rails new container-file-path -d=postgresql`. Then, set up `config/database.yml` with a host, username and password.

```
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: db
  username: postgres
  password: guest

development:
  <<: *default
  database: boats_development

test:
  <<: *default
  database: boats_test

production:
  <<: *default
  database: boats_production
```

## Other useful commands

### To stop a container
Stopped containers maintain their state and can be started again to resume work.

```
sudo docker stop foo_rails
```

### To start a stopped container
```
sudo docker start -i foo_rails
```

### To see all containers
```
sudo docker ps -a
```

### To enter a new bash shell in a running container (from a separate terminal)
```
sudo docker exec -it foo_rails bash
```
