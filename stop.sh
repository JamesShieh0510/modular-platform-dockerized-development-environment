if [ -f "./modular-platform-dockerized-development-environment/stop.sh" ]
then
    cd ./modular-platform-dockerized-development-environment
fi

docker kill $(docker ps -q)

mv ../.env.old ../.env

cd ..