RUN := run --rm
DOCKER_COMPOSE_RUN := docker-compose -f compose-dev.yaml $(RUN)

setup:
	@make build
	@make dbcreate
	@make dbmigrate
	@make dbseed
	@make yarn_install

build:
	docker-compose -f compose-dev.yaml build

up:
	docker-compose -f compose-dev.yaml up

up_d:
	docker-compose -f compose-dev.yaml up -d

down:
	docker-compose -f compose-dev.yaml down

bundle_install:
	${DOCKER_COMPOSE_RUN} web bundle install

yarn_install:
	${DOCKER_COMPOSE_RUN} web yarn install

console:
	${DOCKER_COMPOSE_RUN} web rails c

dbcreate:
	${DOCKER_COMPOSE_RUN} web rails db:create

dbmigrate:
	${DOCKER_COMPOSE_RUN} web rails db:migrate

dbseed:
	${DOCKER_COMPOSE_RUN} web rails db:seed

dbreset:
	${DOCKER_COMPOSE_RUN} web rails db:migrate:reset
	@make dbseed

rspec:
	${DOCKER_COMPOSE_RUN} web rspec

standard:
	${DOCKER_COMPOSE_RUN} web standardrb

standard_fix:
	${DOCKER_COMPOSE_RUN} web standardrb --fix

erblint:
	${DOCKER_COMPOSE_RUN} web erblint --lint-all

erblint_fix:
	${DOCKER_COMPOSE_RUN} web erblint --lint-all -a
