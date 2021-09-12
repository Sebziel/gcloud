The deployment Simple Apache Deployment - sad, contains:

-medium vm instance set up in vm.jinja, used by ApacheDeployment.yaml
-network set up in network-template.jinja , used by ApacheDeployment.yaml
-Firewall rule to open port 22 and 80 set up in network-template.jinja , used by ApacheDeployment.yaml
-subnetwork set up in subnetwork-temp.jinja

How to run?

Make sure all network, compute, deployment API's are switched on.
cd into */SimpleApache and run below command:

gcloud deployment-manager deployments create sad --config ApacheDeployment.yaml

Below prompt with all listed resourced should be displayed in cli

NAME                                 TYPE                   STATE      ERRORS  INTENT
my-homepage-firewall-rule            compute.v1.firewall    COMPLETED  []
simple-apache-deployment-instance    compute.v1.instance    COMPLETED  []
simple-apache-deployment-network     compute.v1.network     COMPLETED  []
simple-apache-deployment-subnetwork  compute.v1.subnetwork  COMPLETED  []


As an expected outcome, a simple html website with text "Succesfully deployed simple apache!" should be created an available under the vm instance public IP address over http protocol.




In order to remove the deployment run below command in */SimpleApache catalog and confirm with an 'y'. 

gcloud deployment-manager deployments delete sad

#Possible issues:
In case of issue with the OS image, make sure to check the current images list URI's as they may change acrros the time. 

gcloud compute images list --uri