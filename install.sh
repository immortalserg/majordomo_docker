#!/bin/bash
echo -e "\033[35m Запускаю установку...\033[0m"
read -p "Задайте пероль базы данных (по умолчанию majordomo):" passw

if [ "$passw" = "" ]; then
passw="majordomo"
fi



sed -i "/MARIADB_ROOT_PASSWORD/s/majordomo/$passw/" .env
echo 'OK'
. ./.env
apt -qq update -y
apt -qq upgrade -y
apt -qq install git -y
git clone https://github.com/sergejey/majordomo.git ./www/majordomo
cp ./app-conf/config.php ./www/majordomo/config.php
sed -i "/DB_PASSWORD/s/'majordomo'/'$passw'/" ./www/majordomo/config.php
chmod 777 www
docker compose up -d

tee ./www/majordomo/dbdump.sh << EOF
#!/bin/bash
echo "устанавливаю дамп базы"
mariadb -u root -p$MARIADB_ROOT_PASSWORD db_terminal < /var/www/majordomo/db_terminal.sql
echo "OK"
EOF
chmod +x ./www/majordomo/dbdump.sh
echo -e "\033[35m  минуточку...\033[0m"
sleep 30
docker exec mariadb /var/www/majordomo/dbdump.sh
rm ./www/majordomo/dbdump.sh
echo -e "\033[32m Установка завершена.\033[0m"
echo "MajorDomo установлен, зайдите по адресу http://localhost"
echo "PHPMyAdmin установлен, зайдите по адресу http://pma.localhost"
echo "Supervisor установлен, зайдите по адресу http://sv.localhost"




