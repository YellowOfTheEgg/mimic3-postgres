.PHONY: build
build:
	docker-compose -f docker-compose.yml build

.PHONY: up

up: down
		docker-compose -f docker-compose.yml up -d

.PHONY: down
down:
		docker-compose -f docker-compose.yml down -v
.PHONY: clean
clean:	
	docker rm $$(docker ps -a  --filter "name=mimic3-db" --filter "name=mimic3-postgres_pgadmin_1" -q)
	sudo rm -r db-data
	
