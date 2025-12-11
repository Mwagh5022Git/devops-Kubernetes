How to Create a Kind Cluster (Step-by-Step)
Prerequisites

Before creating a Kind cluster, make sure you have:

✔ Docker installed

Check:

docker --version


If not installed, install Docker first.

✔ Kind installed

Check:

kind --version


Install Kind:

curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

🚀 Create a Simple Kind Cluster

Run:

kind create cluster


This will create:

A default cluster named kind

A single control-plane node

Check cluster:

kubectl cluster-info
kubectl get nodes

🧩 Create a Kind Cluster with a Custom Name
kind create cluster --name mycluster

⚙️ Create a Multi-Node Cluster (Advanced)

Create a config file:

kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
  - role: worker
  - role: worker


Run:

kind create cluster --name demo --config kind-config.yaml


Check:

kubectl get nodes

💥 Delete Kind Cluster
kind delete cluster


or specify name:

kind delete cluster --name demo
