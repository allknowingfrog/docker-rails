# Getting Started

### Build Initial Rails Project
If you have just cloned this repository, you are almost there!
The following command will get you started with a new Rails project that uses MySQL as the backend database:

`docker-compose run web rails new -s -d mysql .`

Alternatively, you can roll with the default SQLite database driver (not reccomended in most cases):

`docker-compose run web rails new -s .`

### Run Docker Environment
`docker-compose up -d`

Your project will be located at `localhost:3000`

### Stop/Restart Docker Environment
`docker-compose stop` /
`docker-compose restart`

### Destroy Docker Environment
`docker-compose down`-
