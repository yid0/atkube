output "namespace_dev" {
    description = "Minikube name "
    value =  "dev"
}

output "cluster_ip" {
  value = null_resource.cluster_ip.id
}