# Terraform an application onto your Docker Desktop k8s
Study the .tf files - and replace `<your_username>` with your Docker Hub username in deployment.tf

    terraform init
    terraform plan
    terraform apply

 Check what Terraform has created:

    terraform show
    kubectl get deployment
    kubectl get service


# Terraform Cleanup

    terraform destroy

Restore kubectl to Docker Desktop config

    kubectl config use-context docker-desktop
