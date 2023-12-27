up:
	docker compose -f srcs/docker-compose.yml up -d

restart:
	docker compose -f srcs/docker-compose.yml restart

stop:
	docker compose -f srcs/docker-compose.yml stop

down:
	docker compose -f srcs/docker-compose.yml down -v

rmi:
	docker image rm srcs_mariadb
	docker image rm srcs_nginx
	docker image rm srcs_wordpress

prune:
	docker system prune -af

docker_restart:
	systemctl restart docker
