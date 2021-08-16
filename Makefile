COMPOSE = srcs/docker-compose.yaml
IMGS = nginx-container wordpress-container mariadb-container
ALL_IMGS = $(shell docker ps -aq)
ALL_CONTAINERS = $(shell docker image ls -aq)
ALL_VOLUMES = $(shell docker volume ls -q)
ALL_NETWORKS = $(shell docker network ls -q)

all :
	sudo sed -i '1 i\127.0.0.1\tjabenjam.42.fr' /etc/hosts
	@echo "added jabenjam.42.fr to known hosts"
	docker network create inception_network  || /bin/true
	@echo "created inception network"
	export $(cat ./srcs/.env | xargs)
	@echo "added variables to the environment"
	sudo mkdir -p /home/jabenjam/data/wordpress /home/jabenjam/data/mysql
	sudo chown mysql:mysql /home/jabenjam/data/mysql
	sudo chown www-data:www-data /home/jabenjam/data/wordpress
	@echo "Created directories where volumes will be mounted"
	docker-compose -f $(COMPOSE) up --build -d
	@echo "created inception containers"
	@echo "OK!"

start :
	docker-compose -f $(COMPOSE) start

stop :
	docker-compose -f $(COMPOSE) stop

restart : stop start

clean :
	docker-compose -f $(COMPOSE) down
	@echo "removed inception containers"

fclean : clean
	unset $(cat ./srcs/.unset | xargs)
	docker image rm -f $(IMGS)
	@echo "removed inception images"
	docker volume rm $(docker volume ls -q) || /bin/true
	@echo "removed all volumes"
	sudo sed -i '/127.0.0.1\tjabenjam.42.fr/d' /etc/hosts
	@echo "removed jabenjam.42.fr from known hosts"
	@docker rm -f $(ALL_IMGS) || /bin/true
	@docker image rm -f $(ALL_CONTAINERS) || /bin/true
	@docker volume rm -f $(ALL_VOLUMES) || /bin/true
	@docker network rm $(ALL_NETWORKS) || /bin/true
	sudo rm -rf /home/jabenjam/data
	@echo "Purged all existing images, containers, networks and volumes"

re : fclean all

.PHONY : setup all clean fclean re