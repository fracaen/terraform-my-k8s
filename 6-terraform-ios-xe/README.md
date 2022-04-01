# Create a loopback interface on a IOS XE device using Terraform and RESTCONF
Edit main.tf with the device IP, as well as the Loopback number and address.

Make sure TCP/443 is open to the device.

    terraform init
    terraform plan
    terraform apply
  
ssh to the router and validate.

# Terraform Cleanup

    terraform destroy

Caution: this does not actually do anything other than destroying the Terraform state. This Terraform provider is not declarative.