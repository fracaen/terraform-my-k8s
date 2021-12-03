# Terraform a Kubernetes cluster (AWS EKS)
If needed, download AWS cli: https://aws.amazon.com/cli/

Study the .tf files

    terraform init
    terraform plan
    terraform apply
    aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

Continue to [deploying an app on your k8s cluster](../4-terraform-k8s-lab), or stop here and...

## Terraform Cleanup

    terraform destroy
