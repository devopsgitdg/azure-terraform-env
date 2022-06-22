.PHONY: all help init validate fmt plan

TERRAFORM=terraform

all: help

help:
	@echo "Make command examples for Ansible"
	@echo "    terraform init                 initial terraform"
	@echo "    terraform validate             validate syntax"
	@echo "    terraform fmt                  format code blocks"
    @echo "    terraform plan                 run process to check output expected"

init:
	$(TERRAFORM) init  

validate:
	$(TERRAFORM) validate

format:
	$(TERRAFORM) fmt

plan:
	$(TERRAFORM) plan



