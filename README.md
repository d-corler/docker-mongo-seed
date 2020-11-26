# docker-mongo-seed

Available in [Docker Hub](https://hub.docker.com/r/wanfoxone/docker-mongo-seed)

## Usage with docker-compose

```yaml
version: '3'

services:
  mongo:
    image: mongo
    container_name: 'my-database'
    environment:
      - MONGO_INITDB_DATABASE=my_database
      - MONGO_INITDB_ROOT_USERNAME=root
      - MONGO_INITDB_ROOT_PASSWORD=1234
    ports:
      - 27017:27017
    volumes:
      - mongodb_data_container:/data/db

  seeding:
    image: wanfoxone/docker-mongo-seed
    container_name: 'my-database-seeding'
    volumes:
      - ./data:/data
    command: >
      mongoimport --uri "mongodb://root:1234@mongo:27017/my_database?authSource=admin" --mode upsert --type json --file /data/users.json --collection users
      && mongoimport --uri "mongodb://root:1234@mongo:27017/my_database?authSource=admin" --mode upsert --type json --file /data/links.json --collection links

volumes:
  mongodb_data_container:
```

## Environment variables

| Variable   | Type   | Default |
| ---------- | ------ | ------- |
| MONGO_HOST | string | `mongo` |
| MONGO_PORT | string | `27017` |
