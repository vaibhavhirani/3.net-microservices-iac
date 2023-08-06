# 3.net-microservices-iac
Infrastructure as Code for 3.net-microservices

# Terraform Module - azure-app-service-docker
## Brief 
- Module provisions resources that are required to run - Dockerized .NET application on linux.
- Module creates following resources
    - Azure Resource Group
    - Azure App Service Plan
    - Azure App Service (Azure Web App for Linux)
    - Azure App Service Slot (Azure Web App Slot for Linux)
    - Azure Container Registry

## Usage
- `main.tf` uses module at `modules/azure-app-service-docker`. 
- Module takes few parameters which can be found here `modules/azure-app-service-docker/variables.tf` and gives output when all the terraform scripts are applied as shown in `modules/azure-app-service-docker/output.tf`
-  Snippet for consumption
    ```
        module "my_az_module" {
            source = "./modules/azure-app-service-docker"
            registry_name = <your input>
            app_service_plan_name = <your input>
            app_service_name = <your input>
            app_service_plan_os = <your input>
            app_service_plan_sku = <your input>
            region = <your input>
            resource_group_name = <your input>
            sku = <your input>  
        }

    ```