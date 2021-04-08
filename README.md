# 1. Pre-history
Started with namespaces 2002 / cgroups 2007  
Compartimentalize and limit process resources

# 2. Docker Containers
## 2.1 Basic Docker operations
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

## 3.2 Kubernetes Pods
Pods are the simplest building block in Kubernetes, similar to the docker run command:
* Starts up only one instance of your container image.
* Will not keep restarting the container if it finishes/fails/dies.

Navigate to the docker-lab directory in the cloned repository and study the pod.yaml file.

    kubectl create -f pod.yaml
    kubectl get pod
    kubectl logs web-app-pod
    kubectl describe pod web-app

## 3.3 Kubernetes Services
Services expose a container or group of containers to access from outside the cluster. Services can also support load balancing across multiple pods.

Study the service.yaml file.

    kubectl create -f service.yaml
    kubectl get services
    kubectl describe service web-app-service

Delete the pod before moving on to deployments:

    kubectl delete po web-app-pod

## 3.4 Kubernetes Deployments
Deployments automate the creation and management of pods. You just tell Kubernetes how many replicas / copies you want of your app / pod. Deployments are how Kubernetes is most commonly used.

Study the deployment.yaml file.

    kubectl create -f deployment.yaml
    kubectl get deployments
    kubectl get pods

Optional: 
1. try changing the image to trxuk/clus-1999-app3 , which shows hostname of the container.
2. try adding /shutdown at the end of the url

Change the number of replicas in deployment.yaml , then

    kubectl apply -f deployment.yaml

Clean up:

    kubectl delete service web-app-service
    kubectl delete deployment web-app-deployment

# 4. Terraform 
## 4.1 Terraform a Kubernetes cluster (AWS EKS)
If needed, download AWS cli: https://aws.amazon.com/cli/

Study the .tf files

    terraform init
    terraform plan
    terraform deploy
    aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

## 4.2 Terraform an application onto that EKS cluster
Study the .tf files

    terraform init
    terraform plan
    terraform deploy

# 5. Final Cleanup
In **both** Terraform workspaces / directories:

    terraform destroy

Restaure kubectl to Docker Desktop config

    kubectl config use-context docker-desktop

# 6. To Do
* report error in https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-03-build/step/3 - should be container ID or name, not image name

# 7. References
https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-02-setup/step/1

https://developer.cisco.com/learning/modules/cisco-app-first-security-docker/docker-lab-03-build/step/1

https://developer.cisco.com/learning/tracks/containers/containers-mgmt/containers-deploy-to-k8s/step/2

https://learn.hashicorp.com/tutorials/terraform/eks

https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider
