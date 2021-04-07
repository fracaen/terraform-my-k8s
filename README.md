# 1. Pre-history
Started with namespaces 2002 / cgroups 2007  
Compartimentalize and limit process resources

# 2. Docker Containers
2013

## 2.1 Basic Docker operations
Test your installation with:

    docker run hello-world

Comes from https://hub.docker.com/_/hello-world/
    
Run [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu) in a container and `echo` a message:

    docker run ubuntu /bin/echo hello world

Run an interactive shell in Ubuntu:

    docker run -t -i ubuntu /bin/bash
        ls
        cat /etc/issue
        ps aux
        exit

See the list of containers in your system (running vs running & exited):

	docker ps
    docker ps -a

See the _top_ processes running inside your container with:

    docker top <CONTAINER ID>

## 2.2 Building Docker images

Clone the code repository:

    git clone https://github.com/CiscoDevNet/app-first-security-code.git

Navigate to the docker-lab directory in the cloned repository and study the app.py file. This is the application that you are going to deploy.

Now study the Dockerfile

https://developer.cisco.com/learning/modules?keywords=kubernetes


https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-02-setup/step/1

https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-03-build/step/1
    


# 3. Kubernetes 
2014

# 4. Terraform 
2014  
EKS

# 5. To Do
Create my own repo with content from https://github.com/CiscoDevNet/app-first-security-code.git
