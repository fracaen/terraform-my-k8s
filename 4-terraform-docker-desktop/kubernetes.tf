# Configure Kubernetes provider and connect to the Kubernetes API server provided by Docker Desktop
provider "kubernetes" {
  host = "https://localhost:6443"
  config_path = "~/.kube/config"
}