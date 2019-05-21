# make sure all container is stop and .env return to the original setting
if [ -f "./modular-platform-dockerized-development-environment/stop.sh" ]
then
    cd ./modular-platform-dockerized-development-environment
    . ./stop.sh
    cd ./modular-platform-dockerized-development-environment
else
    . ./stop.sh
fi

# get environment variable from docker .env
export  $(cat .env | grep -w DATA_PATH_HOST | awk '{ print $1}')
export  $(cat .env | grep -w MYSQL_DATABASE | awk '{ print $1}')
export  $(cat .env | grep -w MYSQL_USER | awk '{ print $1}')
export  $(cat .env | grep -w MYSQL_PASSWORD | awk '{ print $1}')
export LAN_IP=$(ifconfig en0 | grep -w inet | awk '{print $2'})


# environment variable from laravel .env
# OLD_DB_HOST_IP= $(cat ../.env | grep -w DB_HOST | awk '{print $1'})
# OLD_REDIS_HOST_IP= $(cat ../.env | grep -w REDIS_HOST | awk '{print $1'})

# save current .env
cp ../.env ../.env.old

# create new .env for docker
sed -e 's@'"$(cat ../.env | grep -w DB_HOST | awk '{print $1'})"'@'"DB_HOST=$LAN_IP"'@' \
    -e 's@'"$(cat ../.env | grep -w REDIS_HOST | awk '{print $1'})"'@'"REDIS_HOST=$LAN_IP"'@' \
    -e 's@DB_DATABASE=homestead@'"DB_DATABASE=$MYSQL_DATABASE"'@' \
    -e 's@DB_USERNAME=homestead@'"DB_USERNAME=$MYSQL_USER"'@' \
    -e 's@DB_PASSWORD=secret@'"DB_PASSWORD=$MYSQL_PASSWORD"'@' \
     ../.env.old > ../.env

# start docker for laravel
docker-compose up -d nginx redis workspace mysql phpmyadmin laravel-echo-server php-worker

docker exec -it laradock_nginx_1 nginx -s reload
docker exec -it laradock_workspace_1 chmod -R 777 ./

$ install laravel project
docker exec -it laradock_workspace_1 composer install

echo "IP:$LAN_IP"
echo "DATA_PATH:$DATA_PATH_HOST"
echo "Database Info:"
echo "USER:$MYSQL_USER"
echo "PASSWORD:$MYSQL_PASSWORD"

cd ..