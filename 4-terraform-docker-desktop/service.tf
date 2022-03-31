resource "kubernetes_service" "web-app-service" {
  metadata {
    name = "my-web-app"
  }
  spec {
    selector = {
      App = kubernetes_deployment.web-app-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 5500
      target_port = 5500
    }

    type = "LoadBalancer"
  }
}

output "lb_ip" {
  value = kubernetes_service.web-app-service.status.0.load_balancer.0.ingress.0.hostname
}
