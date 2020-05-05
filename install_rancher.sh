#/bin/bash
helm upgrade rancher rancher-latest/rancher \
  --namespace cattle-system \
  -f rancher_helm_config.yaml
