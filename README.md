# Creating an application using microservices in docker


## Monolithic Architecture

### - A monolithic architecture is the traditional unified model for the design of a software program.

### - Monolithic software is designed to be self-contained; components of the program are interconnected and interdependent rather than loosely coupled


## What is microservices

- What sets a microservices architecture apart from more traditional, monolithic approaches is how it breaks an app down into its core functions. Each function is called a service, and can be built and deployed independently, meaning individual services can function without negatively affecting the others. This helps to make constant iteration and delivery (CI/CD) more seamless and achievable.

![](/images/monolithic-vs-microservices.png)

### - A lefthand side bar could represent a service, meanining we can easily make changes to it without affecting other parts of the website

### - Microservices is all about breaking down apps into their core functions which can communicate to eachother through API calls
- 

### Advantages of Microservices

- **Scalability**: Since the services are seperate, we can easily scale the most needed services when necessary as opposed to scaling the whole application, thus improving cost savings

- **Faster Deplyoments**: Smaller codebases allows for quicker deployments and thus improving the efficiency of the CI/CD pipeline. Leading to greater customer satisfaction

- **More technological flexibility**: Smaller services means that you can try out new tools on an individual service without it affecting the rest of the application, this means organisations can experiment between more efficient tools 


### Disadvantages of Microservices

- **May not be benefifial for small businesses**: Microservices can be difficult to implement for smaller business who don't want to be bogged down in complex orchestration between all the services

- **Global Testing can be more difficult**: In microservices architecture it can difficult to test that all the services are running in complete synchronisation as opposed to a Monolithic archtecture which uses a WAR container



## Creating a Docker file

### 1) We will first create a docker file within our app

```
# This means we wont have to do install node or npm
FROM node:alpine

# Define our working directory inside the container

WORKDIR /usr/src/app

# Copy the dependencies into the container

COPY package*.json ./

# install npm

RUN npm install


# from the current folder we want to copy everything into the working location of the container
COPY . .

# Expose the port in which we will run the application

EXPOSE 3000

# CMD ["node", "seeds/seed.js", "start", "node", "app.js"]

CMD ["node", "app.js"]
```


## Creating a docker-compose file

### 1) This file will 
```
version: '3'

services:
  db:
    # here we are pulling the mongodb image
    image: mongo
    # we want to restart the container whenever we run the file
    restart: always
    # telling the container to run on port 27017
    ports: [27017:27017]

  web:
    # we are specifying the path from where to build are container from
    build: ./app
    restart: always
    # the container will be running from port 3000
    ports: [3000:3000]
    environment:
      # adding the env variable, so the app knows where to locate the db
      - DB_HOST=mongodb://db:27017/posts
    depends_on:
      - db
```



- Within this docker compose we are telling the file where to go to build the image

- When we run docker-compose up we are simply turning those images into a container
  

## Running our docker compose

```
docker-compose up -d 
```

- We can also stop things by running the following
```
docker-compose down
```

## Pushing our image to docker hub

### 1) We will first tag the image id to our new repository

```
docker tag 0f43f6609fb1 aosborne17/microservices-with-docker-and-nodejs:First_Commit
```

### 2) Now we can push it to our docker hub

```
docker push aosborne17/microservices-with-docker-and-nodejs
```

## Creating a setup script to seed our database

### 1) We will create a script that will run our docker-compose file and then enter it at run time and seed our database. It will contain the following:

```
#!/bin/bash

# This file will run our compose yml file and then seed our database
docker-compose up -d
# we are adding a placeholder that will be ewual to the container id of the last made container
# from this we can then enter our container and seed it during runtime
winpty docker exec -it $(docker ps -l --format "{{.ID}}") node seeds/seed.js
```

## Running our script file

### 1) We must make sure we chmod our setup file before running it

```
chmod +x setup.sh
```


### 2) Now when we run the command we can locate to the URLS below and see our application running



![](/images/app-running.png)


![](/images/fibonacci-running.png)


![](/images/posts-running.png)