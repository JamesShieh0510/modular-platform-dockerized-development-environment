export  $(cat .env | grep -w DATA_PATH_HOST | awk '{ print $1}')
export LAN_IP=$(ifconfig en0 | grep -w inet | awk '{print $2'})
rm -r $HOME/.laradock/data/*
docker volume rm laradock_mysql && docker-compose up -d --build --force-recreate --renew-anon-volumes mysql
docker exec -it laradock_workspace_1 composer install
docker exec -it laradock_nginx_1 nginx -s reload
