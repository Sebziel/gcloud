In order to create an ELK deployment download the repository, cd into /gcloud/ELKStack catalog and run below command:

cloud deployment-manager deployments create elkstack --config ekdeploy.yaml 

The ekdeploy.yaml consists of network, subnetwork and firewall rule set up to open default 9200 port used by elasticsearch as well as the vm configuration.
Most of the customizable variables are passed  from the yaml file into the particular jinja files, which references to each other to create the system components in proper order. 

The EK.sh contains installation and conifguration of elastisearch and Kibana. 
Additional logging was enable to help with the troubleshooting upon the startupscript execution, the file is written into the root file /logife.txt

ToDo:

Pass the internal IP address in /etc/elasticsearch/elasticsearch.yml as a variable.
Configure kibana to be set up with the elasticsearch. 
Set up Kibana in a separate server. 

Notes:

Komenda
gcloud compute instances describe ek-deployment --zone=europe-west4-a --format='get(networkInterfaces[0].accessConfigs[0].natIP)' > /home/sebastian_c_zielinski/testfile.txt  #Działa
działa tylko przy odpowiednich ustawieniach praw dostępu dla API vm'ki, trzeba znaleźć sposób na przekazaywanie tych dostepów i potencjalnie nadanie minimalnych wymaganych praw przez deployment managera. 
