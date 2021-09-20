#!/bin/bash

gcloud projects remove-iam-policy-binding causal-temple-319513 --member=serviceAccount:ekserviceaccount@causal-temple-319513.iam.gserviceaccount.com --role=roles/compute.viewer
gcloud deployment-manager deployments delete elkstack