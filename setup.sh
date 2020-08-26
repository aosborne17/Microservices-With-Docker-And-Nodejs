#!/bin/bash

# This file will run our compose yml file and then seed our database
docker-compose up -d
# we are adding a placeholder that will be ewual to the container id of the last made container
# from this we can then enter our container and seed it during runtime
winpty docker exec -it $(docker ps -l --format "{{.ID}}") node seeds/seed.js
