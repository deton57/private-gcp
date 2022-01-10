**Welcome to Wordpress website on GKE.** 

This workshop will create the following Terraform managed resources: 

* It will enable API services in your GCP project

* It will create a VPC, with secondary ranges and VPC service connection. 

* It will create a GKE cluster 

* It will create a CloudSQL database 

* It will create a PD with PV and PVC.

* It will create Kubernetes Secret, Service and Deployment with Wordpress.

Once the the run successfully finish you will be able to access your Wordpress website, 
by accessing the external IP address in your browser. 

In order to run the following Terraform, please make sure you have:
1. Terraform installed 
2. Terraform is authenticated with your GCP credentials 
3. Make sure you edit the **terraform.tfvars** file, with your existing Project ID and other variables.
run **starter.sh**

*This is a sample project, this is not recommended for production use.
