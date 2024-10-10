export POSTGRES_USER=${POSTGRES_USER:-root}
export POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-root}
export POSTGRES_DB=${POSTGRES_DB:-database}



docker compose up --build --force-recreate -d