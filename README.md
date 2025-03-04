Installation:

sudo docker compose up --build -d

docker exec -it <postgres_container_id> bash

for windows:
powershell -Command "bin/rails db:migrate; bin/rails db:seed; bin/rails server -b 0.0.0.0"

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
