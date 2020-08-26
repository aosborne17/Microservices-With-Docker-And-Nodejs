# Creating an application using microservices in docker


## What is microservices

- What sets a microservices architecture apart from more traditional, monolithic approaches is how it breaks an app down into its core functions. Each function is called a service, and can be built and deployed independently, meaning individual services can function without negatively affecting the others. This helps to make constant iteration and delivery (CI/CD) more seamless and achievable.

![](/images/monolithic-vs-microservices.png)

- e.g A lefthand side bar could represent a service, meanining we can easily make changes to it without affecting other parts of the website

- Microservices is all about breaking down apps into their core functions which can communicate to eachother through API calls
- 

### Advantages of Microservices

- **Scalability**: Since the services are seperate, we can easily scale the most needed services when necessary as opposed to scaling the whole application, thus improving cost savings

- **Faster Deplyoments**: Smaller codebases allows for quicker deployments and thus improving the efficiency of the CI/CD pipeline. Leading to greater customer satisfaction

- **More technological flexibility**: Smaller services means that you can try out new tools on an individual service without it affecting the rest of the application, this means organisations can experiment between more efficient tools 


### Disadvantages of Microservices

- **May not be benefifial for small businesses**: Microservices can be difficult to implement for smaller business who don't want to be bogged down in complex orchestration between all the services



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