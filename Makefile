.PHONY:	minikube-install
minikube-install: 
	./scripts/minikube.sh

.PHONY:	terraform-install
terraform-install: 
	./scripts/terraform.sh

.PHONY:	terraform-init
terraform-init:
	cd terraform && terraform init

.PHONY:	terraform-validate
terraform-validate:
	cd terraform && terraform validate

.PHONY:	terraform-plan
terraform-plan:
	cd terraform && terraform plan

.PHONY:	terraform-refresh
terraform-refresh:
	cd terraform && terraform refresh

.PHONY:	terraform-apply
terraform-apply:
	cd terraform && terraform apply --auto-approve

.PHONY:	terraform-destroy
terraform-destroy:
	cd terraform && terraform destroy --auto-approve