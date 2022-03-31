resource "kubernetes_deployment" "web-app-deployment" {
  metadata {
    name = "my-web-app"
    labels = {
      App = "mywebapp"
    }
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        App = "mywebapp"
      }
    }
    template {
      metadata {
        labels = {
          App = "mywebapp"
        }
      }
      spec {
        container {
          image = "<your_username>/my-web-app"
          name  = "web-app"

          port {
            container_port = 5500
          }
        }
      }
    }
  }
}
