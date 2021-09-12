Komenda
gcloud compute instances describe instancewoaccess --zone=us-central1-a   --format='get(networkInterfaces[0].accessConfigs[0].natIP)' > /home/sebastian_c_zielinski/testfile.txt

gcloud compute instances describe ek-deployment --zone=europe-west4-a --format='get(networkInterfaces[0].accessConfigs[0].natIP)' > /home/sebastian_c_zielinski/testfile.txt  #Działa
działa tylko przy odpowiednich ustawieniach praw dostępu dla API vm'ki, trzeba znaleźć sposób na przekazaywanie tych dostepów i potencjalnie nadanie minimalnych wymaganych praw przez deployment managera. 

obecnie skonfigurowaną vm'ke trzeba będzie dorzucić do odpowiedniego subnetworku, bo jeszcze nie zostąło to zrobione, sam network i subnetwork wyglada spoko chociaż jeszcze nie były testowane. 


poniższy skrypt sh poprawnie instaluje kibane i elastica na jednej masyznie. 


#!/bin/bash

sudo apt-get update
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install elasticsearch kibana
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
sudo systemctl enable kibana.service
sudo systemctl start kibana.service