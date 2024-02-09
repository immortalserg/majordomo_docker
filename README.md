# Установка MajorDoMo в Docker

Установите Docker 

Установите git

выполните следующие команды:
```
git clone https://github.com/immortalserg/majordomo_docker.git
cd majordomo_docker
chmod +x install.sh
./install.sh
```
на запрос введите пароль для базы данных

дождитесь установки

войдите в браузере по адресу: http://localhost

phpmyadmin находится по адресу: http://pma.localhost

supervisor находится по адресу: http://sv.localhost

порты можно поменять в файле .env

включить порты mysql, php-fpm можно отредактировав файл docker-compose.yaml убрав комментарии

## Установка пароля
phpmyadmin, supervisor и majordomo доступны без пароля, для установки паролей на majordomo, phpmyadmin и supervised я рекомендую пользоваться средствами nginx, поскольку нет необходимости делать изменения в конфигурационных файлах разных сервисов, всё пароли устанавливаются в одном файле. Для этого создайте пароль в файле паролей, это можно сделать с помощью утилиты htpasswd которая есть в контейнере supervisor
```
docker exec -it supervisor htpasswd /nginx/conf/.htpass ИМЯ_ПОЛЬЗОВАТЕЛЯ
```
соответственно ИМЯ_ПОЛЬЗОВАТЕЛЯ надо заменить на свое. Запросит ввести пароль 2 раза. Далее надо раскомментировать строки в файле /nginx/sites-enabled/majordomo
```
auth_basic "Enter password!";
auth_basic_user_file /etc/nginx/conf/.htpass;
```
после изменений в конфигурационные файлы nginx необходимо перезапустить nginx командой
```
docker exec nginx nginx -s reload
```
## Другие особенности
### Использование miIO
miIO использует порт UDP 54321 нам надо пробросить данный порт. Для этого раскомментируем соответствующие строки
```
#  - 54321:54321/udp
#  - 54321:54321/tcp
```
