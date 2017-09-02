## Docker-compose enabled Rails
Basic setup of Rails w/ Docker support. Follows https://docs.docker.com/compose/rails, substituting Postgre with MySQL

### Initial Setup
- Clone this respository
- Run `docker-compose run web rails new . --force --database=mysql`
- Set up your database configuration (https://docs.docker.com/compose/rails/#connect-the-database)
- Run `docker-compose up` (opt `-d` for detatched mode)

### Rebuilding a Dev Environment
- Run `rm <project root>/tmp/pids/server.pid` (clear previous server mapping)
- Run `docker-compose up` (opt `-d` for detatched mode)
- Run `docker-compose run web rake db:create` (Run application migrations)
