

Set up a Minikube cluster with Terraform to ensure provisioning and Ansible for different kinds of configurations

## Requirements


- Install terraform


        make terraform-install

- Install minikube

        make minikube-install

## Provisioning

- To start provisioning pods with Terraform inside the Minikube cluster.
               
                make terraform-init
                make terraform-plan 
                make terraform-apply