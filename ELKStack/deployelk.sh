#!/bin/bash

#Assigning current project id as variable
PROJECT=$(gcloud config list --format 'value(core.project)')

#Assigning service account email as variable, filter value have to be obtained from ekserviceaccount.jinja file parameter .

#Creating deployment and separate project-wide role for service account, required for application configuration.

gcloud deployment-manager deployments create elkstack --config ekdeploy.yaml

#Assigning service account email as variable, filter value have to be obtained from ekserviceaccount.jinja file parameter .
EMAIL=$(gcloud iam service-accounts list --filter="EMAIL ~ ekserviceaccount" --format 'value(email)')
gcloud projects add-iam-policy-binding $PROJECT \
    --member=serviceAccount:$EMAIL --role=roles/compute.viewer