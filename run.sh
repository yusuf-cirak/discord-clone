export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-root}
export MYSQL_DATABASE=${MYSQL_DATABASE:-database}


docker compose up --build --force-recreate -d