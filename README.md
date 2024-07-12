# Azure Serverless Function with API Management Automation

## Overview
This project automates the deployment of an Azure Function App integrated with Azure API Management using Terraform. It sets up the necessary infrastructure and configurations to enable serverless computing with API management on Azure.

## Features
- **Azure Resources**: Creates Azure Function App, API Management service, and necessary dependencies.
- **Deployment Automation**: Uses Terraform for infrastructure provisioning and configuration.
- **Integration**: Configures API Management to front-end Azure Function App endpoints.
- **Flexibility**: Easily adaptable for different Azure regions, service tiers, and configurations.

## Getting Started
To deploy this project, follow these steps:

### Prerequisites
- Install Terraform on your local machine.
- Set up an Azure account and configure Azure CLI access.

### Clone Repository
1. `git clone <repository_url>`
2. `cd <repository_name>`

### Initialize Terraform
1. `terraform init`

### Configure Variables
Update `variables.tf` with your Azure subscription ID, tenant ID, and other required variables.

### Deploy Infrastructure
1. `terraform apply`

### Deploy Function Code
- Zip your Azure Function code and upload it to the specified storage container.
- Update `main.tf` to reference the uploaded zip file for deployment.

### Accessing Resources
- Azure Function endpoints will be accessible through the Azure Function App URL.
- API Management exposes managed APIs based on the Function App's routes.

## Customize
- Adjust `main.tf` and `variables.tf` to fit specific requirements such as region, service tier, and function app configurations.
- Enhance API Management policies (`api_operation_policy.xml`) for advanced routing and transformation needs.

## Contributing
Contributions are welcome! Please fork the repository, make your changes, and submit a pull request. Ensure your code follows the project's coding standards and includes appropriate documentation.

## License
This project is licensed under the MIT License. See LICENSE file for more details.
