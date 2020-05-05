#!/bin/bash
sudo snap install helm --classic
# Add rancher helm charts, see: https://rancher.com/docs/rancher/v2.x/en/installation/k8s-install/helm-rancher/
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo add jetstack https://charts.jetstack.io
