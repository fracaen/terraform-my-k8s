# Docker Containers
## Basic Docker operations
Test your installation with:

    docker search hello-world
    docker run hello-world

Comes from https://hub.docker.com/_/hello-world/
    
Run [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu) in a container and print a string:

    docker run ubuntu /bin/echo hello world

Run an interactive shell in Ubuntu:

    docker run -t -i ubuntu /bin/bash
        ls
        cat /etc/issue
        ps aux
        exit

In another terminal: see the list of containers in your system (running vs running & exited):

	docker ps
    docker ps -a

See the top processes running inside your container with:

    docker top <container id>

Kill it from the outside
    
    docker kill <container id>

## Building Docker images
Navigate to the docker-lab directory in the cloned repository and study the flask-app.py file. 

Now study the Dockerfile

Build the Docker image by running the following command in the root directory of the application:

    docker build --tag <your_username>/my-web-app .

The . at the end of the command tells Docker to search for the Dockerfile in the current working directory. --tag applies the tag my-web-app to the image. 

Observe that the image was created with:

    docker image ls

Run the image as a container after it is built:

    docker run --name web-app -p 5000:5000 <your_username>/my-web-app

In another terminal:

    docker kill web-app

Push to Docker Hub:

    docker push <your_username>/my-web-app

