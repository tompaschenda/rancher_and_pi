# K3s on Raspberry Pi 2
Summary: K3s on Raspberry Pi 2B works perfectly. However Rancher does not.
See https://github.com/rancher/rancher/issues/23397
(the issue is about Pi 4, but the same issue exists on Pi 2B)

# Steps taken to install K3s:
1. Locally installed k3sup, helm and kubectl (automated via Vagrantfile)
2. Installed k3s on RPi using this approach: https://blog.alexellis.io/test-drive-k3s-on-raspberry-pi/ and this: https://github.com/alexellis/k3sup
3. Set up SSH connection to RPi via `ssh pi@raspberrypi`

# Notes:
- k3sup is installed on Vagrant VM (currently manually)
- k3 is installed on RPi
- kubeconfig is stored in git and its path is available in env variable KUBECONFIG
- kubeconfig points to the raspberrypi (IP: 192.168.178.58)
- Rancher is installed with the following settings:
- - certificates from letsencrypt
- - hostname: rancher.paschenda.org

# Installing Rancher
- Tried to install rancher on RPi using: https://rancher.com/docs/rancher/v2.x/en/installation/k8s-install/helm-rancher/
- However, this does not work: `Failed to pull image "rancher/rancher:v2.4.2": rpc error: code = Unknown desc = no matching manifest for linux/arm/v7 in the manifest list entries`
- Attempt 1: Force Rancher to use v2.4.2-linux-arm64 -> Rancher pod gives the following error: `standard_init_linux.go:211: exec user process caused "exec format error"`
- Attempt 2: instruct K3s to use docker instead of (https://blog.alexellis.io/test-drive-k3s-on-raspberry-pi/#comment-4762082001) -> cluster takes much longer to come up, but Rancher still does not work (same error message)

# Things installed on the cluster:
- k8s dashboard: https://github.com/kubernetes/dashboard
- cert-manager: https://cert-manager.io

# Helpful Commands:
- `kubectl cluster-info` should print info about the K3s cluster
- `kubectl get pods -A` shows pods in all namespaces
- `kubectl -n cattle-system describe pod rancher-744c5bdb49-84ngw` describes a certain pod in a specific namespace
