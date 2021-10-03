#!/bin/bash

sudo apt-get update
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install kibana
sudo sleep 120
LOCALIP=$(gcloud compute instances list --filter="NAME ~ kibana-deployment" --format 'value(INTERNAL_IP)')
ELASTICIP=$(gcloud compute instances list --filter="NAME ~ ek-deployment" --format 'value(INTERNAL_IP)')
sudo sed -i "s|#server.host: \"localhost\"|server.host: $LOCALIP|" /etc/kibana/kibana.yml
sudo sed -i "s|#elasticsearch.hosts: \[\"http://localhost:9200\"\]|elasticsearch.hosts: \[\"http://$ELASTICIP:9200\"\]|" /etc/kibana/kibana.yml
sudo systemctl enable kibana.service
sudo systemctl start kibana.service
