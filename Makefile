
NAME	=	up

all		:	${NAME}

${NAME}	:
<<<<<<< HEAD
			mkdir -p /home/nibernar/data/mariadb /home/nibernar/data/wordpress
=======
			mkdir -p /home/nibernar/Bureau/data/mariadb /home/nibernar/Bureau/data/wordpress
>>>>>>> dea6fc01075f3166d4e7d27ea06af46c1f125839
			docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build

down	:
			docker-compose -f srcs/docker-compose.yml down --rmi all --volume --remove-orphans

<<<<<<< HEAD
stop	:	
=======
restart		:
				docker-compose -f /srcs/docker-compose.yml --env-file /srcs/.env restart

stop	:
>>>>>>> dea6fc01075f3166d4e7d27ea06af46c1f125839
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