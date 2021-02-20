PROJECT_NAME	= myproject
ENVFILE		= .env
PHPINIFILE	= ./docker/php-fpm/php.ini
XDEBUGINIFILE	= ./docker/php-fpm/xdebug.ini

.PHONY: start stop redis php

start:
	@bash -c "if [ ! -f \"$(ENVFILE)\" ]; then cp \"$(ENVFILE).dist\" \"$(ENVFILE)\"; fi"
	@bash -c "if [ ! -f \"$(PHPINIFILE)\" ]; then cp \"$(PHPINIFILE).dist\" \"$(PHPINIFILE)\"; fi"
	@bash -c "if [ ! -f \"$(XDEBUGINIFILE)\" ]; then cp \"$(XDEBUGINIFILE).dist\" \"$(XDEBUGINIFILE)\"; fi"
	# export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)
	docker-compose up -d --build

stop:
	docker-compose down

redis:
	docker exec -it --user www-data ${PROJECT_NAME}-redis redis-cli

php:
	docker exec -it --user www-data ${PROJECT_NAME}-php-fpm bash