# Kubernetes 
## Initial test
    kubectl get services
    kubectl get nodes

## Kubernetes Pods
Pods are the simplest building block in Kubernetes, similar to the docker run command:
* Starts up only one instance of your container image.
* Will not keep restarting the container if it finishes/fails/dies.

Navigate to the docker-lab directory in the cloned repository and study the pod.yaml file.

    kubectl create -f pod.yaml
    kubectl get pod
    kubectl logs web-app-pod
    kubectl describe pod web-app

## Kubernetes Services
Services expose a container or group of containers to access from outside the cluster. Services can also support load balancing across multiple pods.

Study the service.yaml file.

    kubectl create -f service.yaml
    kubectl get services
    kubectl describe service web-app-service

Delete the pod before moving on to deployments:

    kubectl delete po web-app-pod

## Kubernetes Deployments
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
