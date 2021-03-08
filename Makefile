include .env

start:
	@bash -c "if [ ! -f \"$(PHPINIFILE)\" ]; then cp \"$(PHPINIFILE).dist\" \"$(PHPINIFILE)\"; fi"
	@bash -c "if [ ! -f \"$(XDEBUGINIFILE)\" ]; then cp \"$(XDEBUGINIFILE).dist\" \"$(XDEBUGINIFILE)\"; fi"
	docker-compose up -d --build

stop:
	docker-compose down

redis:
	docker exec -it --user www-data $(PROJECT_NAME)-redis redis-cli

php:
	docker exec -it --user www-data $(PROJECT_NAME)-php-fpm bash

composer:
	docker-compose run --rm $(PROJECT_NAME)-php-fpm composer