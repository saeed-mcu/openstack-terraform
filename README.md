# OpenStack Terraform Provider Sample

[Terraform](https://www.terraform.io/) is an open-source tool to create and manage cloud infrastructure by coding.
Today, the best practice for infrastructure implementation is IaC or design in form of a set of codes which by reducing the human intervention, allows accurate and fast deployment of infrastructure.

## Structure of Terraform configuration files

Files split logically like this:
* `main.tf` - call modules, locals, and data sources to create all resources

* `variables.tf` - contains declarations of variables used in main.tf

* `outputs.tf` - contains outputs from the resources created in main.tf

## How to use

*__Step1__ (mandatory)* : The *init* command tell Terraform to scan the code, figure out which providers you are using, and download the code for them.
(use proxy for downloading provider if needed)

```bash
terraform init
```

*__Step2__ (mandatory)* : Set your openstack authentication data like `openrc.sh.sample` file
and execute it.
```bash
. openrc.sh
```
*__Step3__ (optional)* :
The *plan* command lets you see what Terraform will do before actually making any changes.
```bash
terraform plan
```
*__Step4__ (mandatory)* : Execute planned actions, creating, updating, or deleting infrastructure resources to match the new state outlined in your IaC.

```bash
 terraform apply
```