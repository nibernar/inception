
NAME	=	up

all		:	${NAME}

${NAME}	:
			mkdir -p /home/nibernar/data/mariadb /home/nibernar/data/wordpress
			docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build

down	:
			docker-compose -f srcs/docker-compose.yml down --rmi all --volume --remove-orphans

stop	:	
			${MAKE} down
			- docker stop $$(docker ps -qa)
			- docker rm $$(docker ps -qa)
			- docker rmi -f $$(docker images -qa)
			- docker volume rm $$(docker volume ls -q)
			- docker network rm $$(docker network ls -q) 2>/dev/null
			sudo rm -rf /home/nibernar/data/mariadb /home/nibernar/data/wordpress

prune	:	
			${MAKE} stop
	   		sudo docker system prune -f --all

re		:	
			${MAKE} stop 
			${MAKE} all

.PHONY		:	all stop down restart re