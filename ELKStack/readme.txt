In order to create an ELK deployment download the repository, cd into /gcloud/ELKStack catalog and run below command:

./deployelk.sh

Shell script was required in order to create project-wide policy binding. Otherwise a separate project would have to be created.

The ekdeploy.yaml consists of network, subnetwork and firewall rule set up to open default 9200 port used by elasticsearch as well as the vm configuration.
Yaml config also contains service account assigned to Elasticsearch VM with with specified gcloud compute API access to obtain IP address necessary in App configuration.
Most of the customizable variables are passed  from the yaml file into the particular jinja files, which references to each other to create the system components in proper order. 

The EK.sh contains installation and conifguration of elastisearch and Kibana, which is downloaded  
Additional logging was enable to help with the troubleshooting upon the startupscript execution, the file is written into the root file /logife.txt

BugFix for passing internal IP address as variable
#EK.sh script was not working correctly, because of the job orders in deployelk.sh script. 
#It created the deployment first, and then assigned a role to service account used by VM. This casued for the ELK config file to have empty host ip addres, making the Elastic component not working.

ToDo:

Pass the internal IP address in /etc/elasticsearch/elasticsearch.yml as a variable.

Set up Kibana in a separate server. 

Configure kibana to be set up with the elasticsearch. 

Set up the startup script in GCP directly, most probably from a file, maybe in the google cloud storage 