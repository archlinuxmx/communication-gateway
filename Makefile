.PHONY: help create-variables build init apply destroy
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create-variables: ## create variables files
	@cp variables/ansible_sample.json variables/ansible.json
	@cp variables/terraform_sample.json variables/terraform.json
	@cp variables/packer_sample.json variables/packer.json

generate-docs: ## generate documentation for variables
	@terraform-docs markdown terraform/ > README.md

build: ## run the unit tests
	@packer build -var-file=variables/packer.json packer/

init: ## generate documentation using pdoc
	@terraform init terraform/

apply: ## create infraestructure
	@terraform apply -var-file=variables/terraform.json terraform/

destroy: ## destroy infrastructure
	@terraform destroy -var-file=variables/terraform.json terraform/
