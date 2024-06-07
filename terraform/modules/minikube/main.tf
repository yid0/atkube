
resource "kubernetes_namespace" "db" {
    metadata {
        name = "db"
    }
}

resource "kubernetes_namespace" "config" {
    metadata {
        name = "config"
    }
}

resource "kubernetes_namespace" "ms" {
    metadata {
        name = "ms"
    }
}

resource "null_resource" "cluster_status" {

  provisioner "local-exec" {
    command = "kubectl get pods -A"
  }

}

resource "null_resource" "cluster_ip" {

  provisioner "local-exec" {
    command = "minikube ip"
  }
}