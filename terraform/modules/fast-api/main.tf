resource "null_resource" "provision_fast-api" {
  provisioner "local-exec" {
    command = "pwd && kubectl apply -f ../deploy/fast-api/deployment.yaml && kubectl apply -f ../deploy/fast-api/service.yaml && kubectl apply -f ../deploy/fast-api/ingress.yaml"
  }

}