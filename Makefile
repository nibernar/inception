NAME	=	up


all		:	${NAME}

${NAME}	:
			mkdir -p /home/nibernar/Bureau/data/mariadb /home/nibernar/Bureau/data/wordpress
			sudo docker-compose -f srcs/docker-compose.yml --env-file srcs/.env up --build

down	:
			docker-compose -f srcs/docker-compose.yml down --rmi all --volume --remove-orphans

stop	:	
			${MAKE} down		
			- docker stop $$(docker ps -qa)
			- docker rm -f $$(docker ps -qa)
			- docker rmi -f $$(docker images -qa)
			- docker volume rm $$(docker volume ls -q)
			- docker network rm $$(docker network ls --format '{{if ne .Name "bridge"}}{{end}}')
			@if [ -d "/home/nibernar/Bureau/data/mariadb" ]; then \
				sudo rm -rf /home/nibernar/Bureau/data/mariadb /home/nibernar/Bureau/data/wordpress; \
			fi

prune	:	
			${MAKE} stop
	   		sudo docker system prune -f --all

re		:	
			${MAKE} stop 
			${MAKE} all