export  $(cat .env | grep -w DATA_PATH_HOST | awk '{ print $1}')

export  $(cat .env | grep -w MYSQL_DATABASE | awk '{ print $1}')
export  $(cat .env | grep -w MYSQL_USER | awk '{ print $1}')
export  $(cat .env | grep -w MYSQL_PASSWORD | awk '{ print $1}')
export LAN_IP=$(ifconfig en0 | grep -w inet | awk '{print $2'})


mv ../.env ../.env.old

sed -e 's@127.0.0.1@'"$LAN_IP"'@' -e 's@DB_DATABASE=homestead@'"DB_DATABASE=$MYSQL_DATABASE"'@' -e 's@DB_USERNAME=homestead@'"DB_USERNAME=$MYSQL_USER"'@' -e 's@DB_PASSWORD=secret@'"DB_PASSWORD=$MYSQL_PASSWORD"'@' ../.env.old > ../.env


docker-compose up -d nginx mysql phpmyadmin redis workspace laravel-echo-server php-worker

docker exec -it laradock_nginx_1 nginx -s reload
docker exec -it laradock_workspace_1 chmod -R 777 ./
