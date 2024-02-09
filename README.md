# Установка MajorDoMo в Docker

Установите Docker 

Установите git или скачайте архив репозитария и распакуйте

выполните следующие команды:

git clone https://github.com/immortalserg/majordomo_docker.git

cd majordomo_docker

chmod +x install.sh

./install.sh

на запрос введите пароль для базы данных

дождитесь установки

войдите в браузере по адресу: http://localhost

phpmyadmin находится по адресу: http://pma.localhost

supervisor находится по адресу: http://sv.localhost

порты можно поменять в файле .env

включить порты mysql, php-fpm можно отредактировав файл docker-compose.yaml убрав комментарии

Для установки паролей на majordomo и supervised я рекомендую пользоваться средствами mginx, для этого создайте пароль в файле паролей, это можно сделать с помощью утилиты htpasswd которая есть в контейнере supervisor

docker exec -it supervisor htpasswd /nginx/conf/.htpass ИМЯ_ПОЛЬЗОВАТЕЛЯ

соответственно ИМЯ_ПОЛЬЗОВАТЕЛЯ надо заменить на свое.

Далее надо раскомментировать строки в файле /nginx/sites-enabled/majordomo
```
auth_basic "Enter password!";
auth_basic_user_file /etc/nginx/conf/.htpass;
```
