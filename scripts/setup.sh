#!/bin/bash

# Create the necessary directories
mkdir -p alt-f4-mainframe/{terraform,ansible}

# Initialize Terraform
cd alt-f4-mainframe/terraform
terraform init

# Copy the Terraform configuration files
cp ../../terraform/* .

# Initialize Ansible
cd ../ansible
ansible-galaxy init roles

# Copy the Ansible configuration files
cp -r ../../ansible/* .

# Run Terraform to create the infrastructure
cd ../terraform
terraform apply

# Run Ansible to configure the servers
cd ../ansible
ansible-playbook -i hosts main.yml
