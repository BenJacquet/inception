COMPOSE = srcs/docker-compose.yaml
IMGS = nginx-container wordpress-container mariadb-container

all :
	sudo sed -i '1 i\127.0.0.1\tjabenjam.42.fr' /etc/hosts
	@echo "added jabenjam.42.fr to known hosts"
	docker network create inception_network
	@echo "created inception network"
	docker-compose -f $(COMPOSE) up -d
	@echo "created inception containers"

clean :
	docker-compose -f $(COMPOSE) down
	@echo "removed inception containers"
	docker network rm inception_network
	@echo "removed inception network"

fclean : clean
	docker image rm -f $(IMGS)
	@echo "removed inception images"
	sudo sed -i '/127.0.0.1\tjabenjam.42.fr/d' /etc/hosts
	@echo "removed jabenjam.42.fr from known hosts"

re : fclean all

.PHONY : setup all cleam fclean re