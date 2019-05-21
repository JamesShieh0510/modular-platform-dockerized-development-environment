if [ -f "./docker-worker/stop.sh" ]
then
    cd ./docker-worker
fi

docker kill $(docker ps -q)

mv ../.env.old ../.env

cd ..