# Mimic3 Postgres database
## Introduction
This service creates a postgres database from mimic csv files based on schema from https://github.com/MIT-LCP/mimic-code.
## Prerequisites
- Docker version >= 19 
- docker-compose version >= 1.26
- Ubuntu 20.04
- Makefile

## Getting Started
1. Download the mimic3 Database
2. Create a folder initialization/data
3. Paste the .CSV-files of the mimic database inside created folder
4. Run to build the image:
```
make build
```
5. Run to start a container:
```
make up
```
After the service has been started up, the container with the database can be accessed over:
```
docker exec -it mimic3-db bash
```
To access the database when you are inside the container run: 
```
psql mimic3 -U admin
```
Alternative access db over pgadmin under following url:
```
http://localhost:5050
```
Credentials for the database are:
- username: admin
- password: admin
- hostname: db

Credentials for pgadmin are:
- username: admin@admin.com
- password: admin

## Migration
For migration copy the whole project folder with mounted volumes to a new location and run:
```
make up
```
