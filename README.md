## Tickebook

docker run --rm -v \$(pwd):/app composer install

cp .env.example .env

nano .env

docker-compose up -d

docker-compose exec app php artisan key:generate

docker-compose exec app php artisan config:cache

docker-compose exec app php artisan migrate
