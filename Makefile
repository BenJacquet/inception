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
	docker-compose -f $(COMPOSE) up -d
	@echo "created inception containers"

clean :
	docker-compose -f $(COMPOSE) down
	@echo "removed inception containers"
	docker network rm inception_network
	@echo "removed inception network"
	unset $(cat ./srcs/.unset | xargs)

fclean : clean
	docker image rm -f $(IMGS)
	@echo "removed inception images" 
#	docker volume rm $(docker volume ls -q)
#	@echo "removed all volumes"
	sudo sed -i '/127.0.0.1\tjabenjam.42.fr/d' /etc/hosts
	@echo "removed jabenjam.42.fr from known hosts"

purge :
	@docker rm -f $(ALL_IMGS) || /bin/true
	@docker image rm -f $(ALL_CONTAINERS) || /bin/true
	@docker volume rm -f $(ALL_VOLUMES) || /bin/true
	@docker network rm $(ALL_NETWORKS) || /bin/true
	@echo "Purged all existing images, containers, networks and volumes"

re : fclean all

.PHONY : setup all clean fclean purge re