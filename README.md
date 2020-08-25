



## Creating network

- Creating a network named sparta app
```
docker network create --driver bridge sparta-app
```

## Running DB

```
docker run -d -p 27017:27017 --network sparta-app --name mongo-db 03c21c6e6451
```

## Running app

```
docker run -d -p 3000:3000 --network sparta-app --name web-app ecceac239120
```