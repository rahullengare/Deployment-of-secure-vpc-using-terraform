# 🌐 Deployment of Secure VPC using Terraform
terrafrom_vpc_infrastructure create vpc, igw, sg, instance with a secure infrastructure using the terraform

This project demonstrates how to provision a **secure AWS VPC infrastructure** using Terraform. The infrastructure includes a custom VPC, Internet Gateway, Security Groups, and an EC2 instance configured following basic security best practices.


## 📌 Project Overview

The goal of this project is to create a secure and structured AWS networking environment using Infrastructure as Code (IaC) with Terraform.

Using Terraform, the following AWS resources are created:

- Virtual Private Cloud (VPC)
- Internet Gateway (IGW)
- Route Table and Route Associations
- Public Subnet
- Security Group (SG)
- EC2 Instance

This project highlights how Terraform can automate cloud infrastructure deployment while maintaining security and modular design.



## 🛠️ Technologies Used

- **Terraform** – Infrastructure as Code tool
- **AWS VPC** – Network isolation
- **AWS EC2** – Compute instance
- **AWS Internet Gateway** – Internet access
- **AWS Security Groups** – Firewall configuration



## 🏗️ Infrastructure Architecture

The Terraform configuration performs the following steps:

1. Creates a custom VPC with a defined CIDR block
2. Creates a public subnet inside the VPC
3. Attaches an Internet Gateway to enable internet access
4. Configures a Route Table for public internet routing
5. Creates a Security Group with controlled inbound/outbound rules
6. Launches an EC2 instance inside the subnet




## 🚀 How to Deploy

### Step 1: Install Terraform

Ensure Terraform is installed:

```
terraform -v
```

If not installed, download it from:
https://developer.hashicorp.com/terraform/downloads

---

### Step 2: Configure AWS Credentials

Make sure AWS CLI is configured:

```
aws configure
```

Provide:
- AWS Access Key
- AWS Secret Key
- Region

---

### Step 3: Initialize Terraform

Navigate to the project folder and run:

```
terraform init
```

---

### Step 4: Validate Configuration

```
terraform validate
```

---

### Step 5: Preview Infrastructure Plan

```
terraform plan
```

---

### Step 6: Apply Configuration

```
terraform apply
```

Type `yes` when prompted.

Terraform will provision the complete secure VPC infrastructure.


## 🔐 Security Configuration

- Custom VPC for network isolation
- Controlled Security Group rules
- Restricted inbound traffic (e.g., SSH only from allowed IPs)
- Public subnet routing through Internet Gateway



## 🧹 Destroy Infrastructure

To delete all created resources:

```
terraform destroy
```




