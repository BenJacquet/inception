COMPOSE = srcs/docker-compose.yaml

setup :
	#sudo adduser jabenjam
	sudo useradd -m -G root jabenjam
	su - jabenjam
	echo "currently logged as $(whoami)"

all : setup
	docker-compose -f $(COMPOSE) up -d
	echo "created all containers"

clean :
	docker-compose -f $(COMPOSE) down -d
	echo "destroyed all containers"

fclean : clean
	su - user42
	echo "currently logged as $(whoami)"
	sudo deluser --remove-home jabenjam
	echo "deleted user jabenjam"

re : fclean all

.PHONY : setup all cleam fclean re