# 1. Pre-history
Started with namespaces 2002 / cgroups 2007  
Compartimentalize and limit process resources

# 2. Docker Containers
## 2.1 Basic Docker operations
Test your installation with:

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

## 2.2 Building Docker images
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



# 3. Kubernetes 
## 3.1 Initial test
    kubectl get services
    kubectl get nodes

## 3.2 Pods
Pods are the simplest building block in Kubernetes, similar to the docker run command:
* Starts up only one instance of your container image.
* Will not keep restarting the container if it finishes/fails/dies.

Navigate to the docker-lab directory in the cloned repository and study the pod.yaml file.

    kubectl create -f pod.yaml
    kubectl get pod
    kubectl logs web-app-pod
    kubectl describe pod web-app
    kubectl delete po web-app-pod

## 3.3 Services
Services expose a container or group of containers to access from outside the cluster. Services can also support load balancing across multiple pods.

# 4. Terraform 
  
EKS

# 5. To Do
* docker push at end of section 2
* remove fracaen from pod.yaml
* report error in https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-03-build/step/3 - should be container ID or name, not image name

# 6. References
https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-02-setup/step/1

https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-03-build/step/1

https://developer.cisco.com/learning/tracks/containers/containers-mgmt/containers-deploy-to-k8s/step/2
