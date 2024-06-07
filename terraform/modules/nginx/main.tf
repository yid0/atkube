resource "null_resource" "provision_nginx" {
  provisioner "local-exec" {
    command = "pwd && kubectl apply -f ${var.path}/volume.yaml && kubectl apply -f ${var.path}/configmap.yaml && kubectl apply -f ${var.path}/deployment.yaml && kubectl apply -f ${var.path}/service.yaml && kubectl apply -f ${var.path}/ingress.yaml" 
  }
}