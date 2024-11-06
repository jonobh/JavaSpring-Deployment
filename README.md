This repository houses code for a simple React/Spring Boot application as well as a deployment pipeline to build the application, package it into a container image, upload it to Azure Container Registry, and publish the new revision of the application to Azure Container Apps across Dev/Prod environments.

Each environment should contain the following secrets:

ACR_PASSWORD - Token which is used by github runners to upload container image to Azure Container Registry.
Each environment should contain the following environment variables:

ACR_NAME - Name of the Azure Container Registry for the given environment.
ACR_USERNAME - Username associated with the ACR token (see secret above).
AZURE_CLIENT_ID - App ID of Service Principal used by deployment.
AZURE_SUBSCRIPTION_ID - ID of subscription where the container app is being deployed.
AZURE_TENANT_ID - ID of Entra tenant where Service Principal exists.
RESOURCE_GROUP - Name of resource group where Azure infrastructure is being deployed.

# react-and-spring-data-rest

The application has a react frontend and a Spring Boot Rest API, packaged as a single module Maven application. You can build the application using maven and run it as a Spring Boot application using the flat jar generated in target (`java -jar target/*.jar`).

You can test the main API using the following curl commands (shown with its output):

---

\$ curl -v -u greg:turnquist localhost:8080/api/employees/3
{
"firstName" : "Frodo",
"lastName" : "Baggins",
"description" : "ring bearer",
"manager" : {
"name" : "greg",
"roles" : [ "ROLE_MANAGER" ]
},
"\_links" : {
"self" : {
"href" : "http://localhost:8080/api/employees/1"
}
}
}

---

To see the frontend, navigate to http://localhost:8080. You are immediately redirected to a login form. Log in as `greg/turnquist`
