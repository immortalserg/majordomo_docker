# Установка MajorDoMo в Docker

Установите Docker 

Установите git или скачайте архив репозитария и распакуйте

выполните следующие команды:

git clone https://github.com/immortalserg/majordomo_docker.git

chmod +x install.sh

install.sh

на запрос введите пароль для базы данных

дождитесь установки

войдите в браузере по адресу: http://localhost

phpmyadmin находится по адресу: http://pma.localhost

supervisor находится по адресу: http://sv.localhost

порты можно поменять в файле .env

включить порты mysql, php-fpm можно отредактировав файл docker-compose.yaml убрав комментарии
