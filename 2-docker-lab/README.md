# Docker Containers
## Basic Docker operations
Test your installation with:

    docker search hello-world
    docker run hello-world

Comes from https://hub.docker.com/_/hello-world/ . What is Docker Hub?
    
Let's run [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu) in a container:

    docker run ubuntu

What happened and why?
How is that possible on macOS or Windows? 

Let's echo world from ubuntu:

    docker run ubuntu /bin/echo hello world

Is the container still running? Why not?

Let's run an interactive shell in Ubuntu:

    docker run -t -i ubuntu /bin/bash
        ls
        cat /etc/issue
        uname -a
        ps aux
        exit

In another terminal: see the list of containers in your system (running vs running & exited):

	docker ps
    docker ps -a

Restart the last ubuntu container in interactive mode

    docker start -i <container id>
    docker ps

See the top processes running inside your container with:

    docker top <container id>

Kill it from the outside
    
    docker kill <container id>

Let's run and exit a few times, and we see containers piling up

    docker run -t -i ubuntu /bin/bash
        exit
    docker ps -a
    docker container prune

To prevent containers from piling up, auto-delete on exit:

    docker run -ti --rm ubuntu

## Building Docker images
Navigate to the docker-lab directory in the cloned repository and study the flask-app.py file. 

Now study the Dockerfile

Build the Docker image by running the following command in the root directory of the application (replace <your_username> with your Docker Hub username):

    docker build --tag <your_username>/my-web-app .

The . at the end of the command tells Docker to search for the Dockerfile in the current working directory. --tag applies the tag my-web-app to the image. 

Observe that the image was created with:

    docker image ls

Run the image as a container after it is built:

    docker run --name web-app -p 5500:5500 <your_username>/my-web-app

In another terminal:

    docker kill web-app

Try running the container again with the same command. Why do you get an error?
Delete the container:
    
    docker rm web-app

Now run it in detached mode:

    docker run --name web-app -p 5500:5500 -d <your_username>/my-web-app

Kill it and then restart it:

    docker kill web-app
    docker start web-app

Log in your local Docker Desktop to Docker Hub **with your Docker Hub username**:
    
    docker login

Push your image to Docker Hub and then review on the web site:

    docker push <your_username>/my-web-app

