🔹 What is EKS?
Amazon EKS (Elastic Kubernetes Service) is a managed Kubernetes service by AWS.
AWS manages:
Control plane
etcd
High availability

You manage:
Worker nodes
Applications
Networking (VPC, security)

Tools Required on Ubuntu
  We need:
  1️⃣ AWS CLI
  2️⃣ kubectl
  3️⃣ eksctl

STEP 1: Install AWS CLI on Ubuntu

    sudo apt update
    sudo apt install unzip curl -y
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
    unzip awscliv2.zip
    sudo ./aws/install
    aws --version

STEP 2: Configure AWS CLI (Login)

    aws configure

OutPut :
    AWS Access Key ID: ********
    AWS Secret Access Key: ********
    Default region name: ap-south-1
    Default output format: json

STEP 3: Install kubectl on Ubuntu

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/

    kubectl version --client
STEP 4: Install eksctl (Main Tool)

    curl --silent --location \
    "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" \ | tar xz -C /tmp
    sudo mv /tmp/eksctl /usr/local/bin

    eksctl version
STEP 5: Create EKS Cluster (Easiest Way)
Basic Command (Recommended for Beginners)

    eksctl create cluster \
    --name demo-cluster \
    --region ap-south-1 \
    --nodegroup-name demo-nodes \
    --node-type t3.medium \
    --nodes 2
What This Command Creates Automatically?

  ✔ EKS Control Plane
  ✔ VPC & Subnets
  ✔ EC2 Worker Nodes
  ✔ Auto Scaling Group
  ✔ IAM Roles
  ✔ Security Groups

STEP 6: Verify Cluster Creation

    kubectl get nodes
Expected:

    NAME                        STATUS   ROLES    AGE   VERSION
    ip-192-168-x-x.ec2.internal Ready    <none>   5m    v1.xx
STEP 7: Check Cluster Details

    eksctl get cluster
STEP 8: Update kubeconfig (If Needed)

    aws eks update-kubeconfig \
    --region ap-south-1 \
    --name demo-cluster
🔹 Architecture (Simple Diagram)

    User (kubectl)
      |
      v
    AWS EKS Control Plane (Managed)
      |
      v
    EC2 Worker Nodes (Node Group)
      |
      v
    Pods & Services
STEP 9: Deploy Test Application

    kubectl create deployment nginx --image=nginx
    kubectl expose deployment nginx --type=NodePort --port=80
Check:

    kubectl get pods
    kubectl get svc
STEP 10: Delete Cluster (VERY IMPORTANT – Save Cost)

    eksctl delete cluster --name demo-cluster --region ap-south-1
