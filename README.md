# 🚀 Terraform Project (GCP Multi-Environment)

This repository contains Terraform code to provision and manage Google Cloud Platform (GCP) infrastructure.
It is structured into multiple environments (dev, prod) to keep configurations isolated.
## 📂 Project Structure

```
terraform-project/
├── environments
│   ├── dev
│   │   ├── dev.tfvars
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── terraform.tfstate
│   │   ├── terraform.tfstate.backup
│   │   ├── tfplan
│   │   └── variables.tf
│   └── prod
│       ├── main.tf
│       ├── prod.tfvars
│       └── variables.tf
└── README.md

4 directories, 12 files
```
## ⚙️ Prerequisites

[Terraform](https://developer.hashicorp.com/terraform) >= 1.5

[Google Cloud SDK](https://cloud.google.com/sdk/docs/install-sdk)

A GCP project with billing enabled

A service account key with appropriate IAM roles

## 🚀 Usage
1️⃣ Initialize Terraform

Go to the environment folder you want to deploy:

```
cd environments/dev   # or environments/prod
terraform init

```

2️⃣ Plan (preview changes)
```
terraform plan -var-file=dev.tfvars   # for dev
terraform plan -var-file=prod.tfvars  # for prod
```

3️⃣ Apply (deploy infra)
```
terraform apply -var-file=dev.tfvars
```
4️⃣ Destroy (cleanup resources)
```
terraform destroy -var-file=dev.tfvars
```
## 📌 Variables

Variables are defined in variables.tf and set via *.tfvars files.

Example dev.tfvars:
```
project_id = "my-dev-project"
region     = "us-central1"
zone       = "us-central1-a"
```
Example prod.tfvars:
```
project_id = "my-prod-project"
region     = "us-east1"
zone       = "us-east1-b"
```
## 📤 Outputs

After terraform apply, Terraform will display key information such as:
```
Outputs:

vm_ip = "34.120.xxx.xxx"
```
## 🔒 Best Practices

Do not commit terraform.tfstate, *.tfvars with secrets, or service account keys.

Use remote state (GCS bucket or Terraform Cloud) for production.

Keep dev lightweight, while prod should be reviewed via PRs and automated CI/CD.

## 🏗️ Next Steps

Add staging/test environment if needed.

Use Terraform modules to avoid code duplication.

Automate deployments with GitHub Actions or Terraform Cloud.

## ✍️ Author: [Ramjan](www.linkedin.com/in/ramjan-r-9a1082164)
## 📌 License: 
This project is licensed under the [MIT License](./LICENSE).
