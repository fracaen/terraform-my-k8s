# Terraform an application onto that EKS cluster
Study the .tf files

    terraform init
    terraform plan
    terraform apply

# Terraform Cleanup
In **both** Terraform workspaces / directories:

    terraform destroy

Restore kubectl to Docker Desktop config

    kubectl config use-context docker-desktop
