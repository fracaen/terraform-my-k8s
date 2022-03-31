resource "kubernetes_service" "web-app-service" {
  metadata {
    name = "my-web-app"
  }
  spec {
    selector = {
      App = kubernetes_deployment.web-app-deployment.spec.0.template.0.metadata[0].labels.App
    }
    type = "NodePort"
    port {
      port        = 5500
      target_port = 5500
    }
  }
}

output "service_random_port" {
  value = kubernetes_service.web-app-service.spec[0].port[0].node_port
}
