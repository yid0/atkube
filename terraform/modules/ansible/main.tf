resource "null_resource" "provision_ansible" {
  provisioner "local-exec" {
    
    command = "pwd && kubectl apply -f ${var.path}/deployment.yaml" 
  }

}