#!/bin/bash

sudo apt-get update
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch 
IP_ADD =$(gcloud compute instances list --filter="NAME ~ ek-deployment" --format 'value(INTERNAL_IP)')
sudo sed -i "s|#network.host: 192.168.0.1|network.host: $IP_ADD|" /etc/elasticsearch/elasticsearch.yml
sudo sed -i 's|#discovery.seed_hosts: \["host1", "host2"\]|discovery.seed_hosts: []|' /etc/elasticsearch/elasticsearch.yml
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service


#gcloud compute instances list --filter="NAME ~ ek-deployment" --format 'value(INTERNAL_IP)'