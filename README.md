# Inception
this is the 42 project Inception

Dockerfiles built from debian bullseye

modify the /etc/hosts file so that https://login.42.fr points to your localhost

the .env file is included in this file but should not be pushed for the project correction

if you want to have wordpress on your localhost modify "DOMAIN_NAME=joerober.42.fr" to "DOMAIN_NAME=localhost"

makefile usage:

- make up to build and start container
- make restart to restart container
- make stop to stop container
- make down to stop container and delete volume + network
- make prune to delete container cache
- make docker_restart to restart docker, does not work on macOS
