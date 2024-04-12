## Terraform Azure Storage Account Setup
This repository contains Terraform configuration files to provision Azure storage accounts.

## Prerequisites
Before you begin, ensure you have the following installed on your local machine:

Terraform \
Azure CLI \
jq

### Getting Started
Clone this repository to your local machine:

```bash
git clone https://github.com/hyferdev/VeeamAzureStorage.git
```
Navigate to the project directory:

```bash
cd VeeamAzureStorage
```
### Azure login
There is an azurelogin script here that will log you into azure and create the service principal needed by Terraform. \
Run the azlogout command when complete to delete this SP. \
Modify azure login script with your subscription name and run using the following command:

```bash
. azurelogin
```

### Deploying azure resources
Initialize Terraform:

```bash
terraform init
```

Review and customize the Terraform configuration files as needed, especially the variable.tf file. \
To apply the Terraform configuration and provision the Azure resources:

```bash
terraform apply
```

If you need to destroy the resources:

```bash
terraform destroy
```

###Azure logout
To remove Terraform's service principle and logout of Azure CLI run the following command:
```bash
. azlogout
```

## Contributions

Contributions to this project are welcome! If you find any issues or have suggestions for improvement, please open an issue or submit a pull request. Feel free to reach out to me directly on [LinkedIn](https://www.linkedin.com/in/desire-banyeretse/).

## License
This project is licensed under the [MIT License](LICENSE). Feel free to modify and distribute it as needed.
