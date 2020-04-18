# docker-adminer
adminer in docker container based on alpine

## Usage
    docker run --rm -p 8000:80 datoma/adminer
    docker run --rm -p 8000:80 -e MEMORY=1G -e UPLOADMAXFILE=4G -e POSTMAXFILE=6G datoma/adminer

## docker-compose
- uses mariaDB
- user: root
- password: example

## Default Values
| Param               | Default Value  |
|---------------------|----------------|
| memory_limit        | 1G             |
| upload_max_filesize | 128M           |
| post_max_size       | 128M           |
    
## Build Infos
build with php modules to support:
- MySQL
- PostgreSQL
- MongoDB
- Sqlite

## official builds:
https://github.com/TimWolla/docker-adminer
https://hub.docker.com/_/adminer?tab=description
