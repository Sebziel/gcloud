In order to create an ELK deployment download the repository, cd into /gcloud/ELKStack catalog and run below command:

./deployelk.sh

Shell script was required in order to create project-wide policy binding. Otherwise a separate project would have to be created.

The ekdeploy.yaml consists of network, subnetwork and firewall rule set up to open default 9200 port used by elasticsearch as well as the vm configuration.
Yaml config also contains service account assigned to Elasticsearch VM with with specified gcloud compute API access to obtain IP address necessary in App configuration.
Most of the customizable variables are passed  from the yaml file into the particular jinja files, which references to each other to create the system components in proper order. 

The EK.sh contains installation and conifguration of elastisearch. Which get's downloaded for a EK VM.
Simmilarly the kibana.sh constains all the necessary config for setting up Kibana. 
Additional logging was enable to help with the troubleshooting upon the startupscript execution, the file is written into the root file /logife.txt

#BugFix for passing internal IP address as variable:
#Both EK.sh and kibana.sh required a sleep to slow down the execution of obtaining the IP addresses.
#It created the deployment first, and then assigned a role to service account used by VM. This casued for the ELK config file to have empty host ip addres, making the Elastic component not working.


ToDo:

Pass the internal IP address in /etc/elasticsearch/elasticsearch.yml as a variable. - DONE
Set up Kibana in a separate server. - DONE
Configure kibana to be set up with the elasticsearch. - Done

Use some markup for more cool READme file.
Set up the startup script in GCP directly, most probably from a file, maybe in the google cloud storage.
Set up the security features across ELK stack. -> Not GCP course related.