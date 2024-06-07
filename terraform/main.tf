
module "minikube" {
  source = "./modules/minikube"
}

module "ansible" {
  source     = "./modules/ansible"
  path       = "../deploy/ansible"
  depends_on = []
}


module "nginx" {
  source     = "./modules/nginx"
  path       = "../deploy/nginx"
  depends_on = [module.ansible]
}


module "fast-api" {
  source     = "./modules/fast-api"
  depends_on = [module.ansible]
}
