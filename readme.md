Containers

    Nginx
    PHP 7.4
    Redis
    PostgreSql 12
    RabbitMQ 3.6.6
    Mailhog

Start

    make start
    For the first launch, you need to use the "cp .env.dist .env" command

Stop

    make stop

Enter to PHP container

    make php

Enter to Redis container

    make redis

Link to the site

    http://PROJECT_NAME.local
    Don't forget to add this to the /etc/hosts file


