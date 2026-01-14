# AI-Powered DevSecOps Pipeline: ChatBot UI Deployment on AWS EKS.   
<img width="2960" height="1247" alt="ChatBot-UI" src="https://github.com/user-attachments/assets/e69c4c5c-fd54-4ced-b22f-8d4558407334" />


## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Architecture](#-architecture)
- [Tech Stack](#-tech-stack)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Deployment](#-deployment)
- [CI/CD Pipeline](#-cicd-pipeline)
- [Security Scanning](#-security-scanning)
- [Configuration](#-configuration)
- [Testing](#-testing)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🌟 Overview

**ChatBot UI** is a production-ready, AI-powered conversational interface built with modern web technologies and deployed using **DevSecOps best practices**. This project demonstrates a complete end-to-end deployment pipeline featuring containerization, orchestration, continuous integration/deployment, and comprehensive security scanning.

### Why This Project?

- **🎯 Personalized AI Interactions**: Natural language processing for human-like conversations
- **⚡ 24/7 Availability**: Always-on service ensuring instant user responses
- **📈 Scalable Architecture**: Built on Kubernetes for handling massive user loads
- **🔒 Security-First**: DevSecOps practices with SonarQube, OWASP, and Trivy scanning
- **🌍 Multi-language Support**: 17+ languages including Arabic, English, French, Spanish, and more
- **🚀 Production-Ready**: Complete CI/CD pipeline with automated testing and deployment

---

## ✨ Features

### Core Features
- 💬 **Real-time Chat Interface** - Instant AI responses with streaming support
- 🎨 **Modern UI/UX** - Built with Next.js, TypeScript, and Tailwind CSS
- 🔌 **Plugin System** - Extensible architecture for custom integrations
- 📱 **Responsive Design** - Mobile-first approach for all devices
- 🌐 **Internationalization** - Support for 17+ languages
- 💾 **Conversation Management** - Save, organize, and search chat history
- 🎯 **Prompt Templates** - Pre-configured prompts for common tasks
- 🔍 **Google Search Integration** - Enhanced responses with web search

### DevSecOps Features
- 🐳 **Docker Containerization** - Consistent deployment across environments
- ☸️ **Kubernetes Orchestration** - Auto-scaling and self-healing capabilities
- 🔄 **CI/CD Pipeline** - Automated testing and deployment with Jenkins
- 📊 **Infrastructure as Code** - Terraform for EKS cluster provisioning
- 🔐 **Multi-layer Security Scanning**:
  - **SonarQube** - Code quality and security analysis
  - **OWASP Dependency Check** - Vulnerability scanning for dependencies
  - **Trivy** - Container image and filesystem security scanning
- 📈 **Monitoring Ready** - Structured for observability integration
- 🎯 **Parameterized Deployments** - Flexible Terraform operations (plan/apply/destroy)

---

## 🏗️ Architecture

### System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                          ChatBot UI Architecture                         │
└─────────────────────────────────────────────────────────────────────────┘

                                 ┌──────────────┐
                                 │   GitHub     │
                                 │  Repository  │
                                 └──────┬───────┘
                                        │
                                        │ Webhook
                                        ▼
                          ┌─────────────────────────────┐
                          │   Jenkins CI/CD Server      │
                          │                             │
                          │  ┌──────────────────────┐  │
                          │  │  Security Pipeline   │  │
                          │  │  ┌────────────────┐ │  │
                          │  │  │  SonarQube    │ │  │
                          │  │  │  Analysis     │ │  │
                          │  │  └────────────────┘ │  │
                          │  │  ┌────────────────┐ │  │
                          │  │  │  OWASP        │ │  │
                          │  │  │  Dependency   │ │  │
                          │  │  └────────────────┘ │  │
                          │  │  ┌────────────────┐ │  │
                          │  │  │  Trivy        │ │  │
                          │  │  │  FS Scan      │ │  │
                          │  │  └────────────────┘ │  │
                          │  └──────────────────────┘  │
                          │  ┌──────────────────────┐  │
                          │  │  Build & Deploy      │  │
                          │  │  - Docker Build      │  │
                          │  │  - Push to Registry  │  │
                          │  │  - Deploy to EKS     │  │
                          │  └──────────────────────┘  │
                          └───────────┬─────────────────┘
                                      │
                                      │ Deploy
                                      ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                          AWS EKS Cluster                                 │
│                                                                           │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                       VPC (10.0.0.0/16)                          │   │
│  │                                                                   │   │
│  │  ┌──────────────────────┐      ┌──────────────────────┐        │   │
│  │  │  Public Subnet       │      │  Public Subnet       │        │   │
│  │  │  10.0.1.0/24         │      │  10.0.2.0/24         │        │   │
│  │  │  ┌────────────────┐  │      │  ┌────────────────┐  │        │   │
│  │  │  │  NAT Gateway   │  │      │  │  NAT Gateway   │  │        │   │
│  │  │  └────────────────┘  │      │  └────────────────┘  │        │   │
│  │  └──────────────────────┘      └──────────────────────┘        │   │
│  │                                                                   │   │
│  │  ┌──────────────────────┐      ┌──────────────────────┐        │   │
│  │  │  Private Subnet      │      │  Private Subnet      │        │   │
│  │  │  10.0.3.0/24         │      │  10.0.4.0/24         │        │   │
│  │  │                       │      │                       │        │   │
│  │  │  ┌────────────────┐  │      │  ┌────────────────┐  │        │   │
│  │  │  │  EKS Node      │  │      │  │  EKS Node      │  │        │   │
│  │  │  │  ┌──────────┐  │  │      │  │  ┌──────────┐  │  │        │   │
│  │  │  │  │ ChatBot  │  │  │      │  │  │ ChatBot  │  │  │        │   │
│  │  │  │  │   Pod    │  │  │      │  │  │   Pod    │  │  │        │   │
│  │  │  │  └──────────┘  │  │      │  │  └──────────┘  │  │        │   │
│  │  │  │  ┌──────────┐  │  │      │  │  ┌──────────┐  │  │        │   │
│  │  │  │  │ ChatBot  │  │  │      │  │  │ ChatBot  │  │  │        │   │
│  │  │  │  │   Pod    │  │  │      │  │  │   Pod    │  │  │        │   │
│  │  │  │  └──────────┘  │  │      │  │  └──────────┘  │  │        │   │
│  │  │  └────────────────┘  │      │  └────────────────┘  │        │   │
│  │  └──────────────────────┘      └──────────────────────┘        │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                           │
│                      ┌──────────────────────────┐                       │
│                      │  Load Balancer Service   │                       │
│                      └────────────┬─────────────┘                       │
└───────────────────────────────────┼───────────────────────────────────┘
                                    │
                                    ▼
                          ┌─────────────────────┐
                          │    End Users        │
                          │  (Web/Mobile)       │
                          └─────────────────────┘
```

### DevSecOps Pipeline Flow

```
┌──────────────────────────────────────────────────────────────────────────┐
│                         Complete CI/CD Pipeline                           │
└──────────────────────────────────────────────────────────────────────────┘

┌────────────┐      ┌────────────┐      ┌─────────────┐
│   Code     │─────▶│  Checkout  │─────▶│  Terraform  │
│  Commit    │      │   Source   │      │  Operations │
└────────────┘      └────────────┘      └──────┬──────┘
                                               │
                    ┌──────────────────────────┘
                    │
                    ▼
        ┌───────────────────────┐
        │  Install Dependencies │
        └───────────┬───────────┘
                    │
                    ▼
        ┌───────────────────────────────────────┐
        │      Security & Analysis (Parallel)    │
        │  ┌─────────────────────────────────┐  │
        │  │  ┌─────────────┐                │  │
        │  │  │ SonarQube   │                │  │
        │  │  │ Code Quality│                │  │
        │  │  └─────────────┘                │  │
        │  │  ┌─────────────┐                │  │
        │  │  │   OWASP     │                │  │
        │  │  │ Dependency  │                │  │
        │  │  │   Check     │                │  │
        │  │  └─────────────┘                │  │
        │  └─────────────────────────────────┘  │
        └───────────────┬───────────────────────┘
                        │
                        ▼
            ┌───────────────────┐
            │   Trivy FS Scan   │
            │  (HIGH/CRITICAL)  │
            └─────────┬─────────┘
                      │
                      ▼
          ┌─────────────────────┐
          │  Docker Build       │
          │  & Push to Registry │
          └──────────┬──────────┘
                     │
                     ▼
          ┌─────────────────────┐
          │  Deploy to EKS      │
          │  kubectl apply      │
          └──────────┬──────────┘
                     │
                     ▼
          ┌─────────────────────┐
          │  Verify Deployment  │
          │  kubectl get svc    │
          └─────────────────────┘
```

### Component Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                      Application Architecture                        │
└─────────────────────────────────────────────────────────────────────┘

                          ┌─────────────────┐
                          │   Next.js App   │
                          └────────┬────────┘
                                   │
                    ┌──────────────┼──────────────┐
                    │              │              │
                    ▼              ▼              ▼
           ┌────────────┐  ┌────────────┐  ┌────────────┐
           │   Pages    │  │Components  │  │    API     │
           │            │  │            │  │   Routes   │
           │ - index    │  │ - Chat     │  │            │
           │ - _app     │  │ - Chatbar  │  │ - /chat    │
           │ - _document│  │ - Promptbar│  │ - /models  │
           └────────────┘  │ - Settings │  │ - /google  │
                           │ - Markdown │  └────────────┘
                           └────────────┘
                                   │
                    ┌──────────────┼──────────────┐
                    │              │              │
                    ▼              ▼              ▼
           ┌────────────┐  ┌────────────┐  ┌────────────┐
           │   Utils    │  │   Types    │  │   Styles   │
           │            │  │            │  │            │
           │ - API      │  │ - Chat     │  │ - Tailwind │
           │ - Helpers  │  │ - OpenAI   │  │ - Globals  │
           │ - Storage  │  │ - Plugin   │  └────────────┘
           └────────────┘  └────────────┘
```

---

## 🛠️ Tech Stack

### Frontend
- **Framework**: Next.js 13+ (React)
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **UI Components**: Custom React components
- **State Management**: React Hooks
- **Internationalization**: next-i18next

### Backend/API
- **Runtime**: Node.js 19
- **API Routes**: Next.js API Routes
- **AI Integration**: OpenAI API
- **Search**: Google Custom Search API

### DevOps & Security
- **Containerization**: Docker
- **Orchestration**: Kubernetes (AWS EKS)
- **CI/CD**: Jenkins
- **IaC**: Terraform
- **Version Control**: Git/GitHub
- **Container Registry**: Docker Hub / AWS ECR

### Security Tools
- **SonarQube** - Code quality and security analysis
- **OWASP Dependency Check** - Dependency vulnerability scanning
- **Trivy** - Container and filesystem security scanning
- **AWS IAM** - Role-based access control

### Infrastructure
- **Cloud Provider**: AWS
- **Compute**: EKS (Elastic Kubernetes Service)
- **Networking**: VPC, Subnets, NAT Gateway, Internet Gateway
- **Load Balancing**: AWS Application Load Balancer

---

## 📦 Prerequisites

Before you begin, ensure you have the following installed and configured:

### Required Software

| Tool | Version | Purpose |
|------|---------|---------|
| Node.js | >= 19.x | Runtime environment |
| npm/yarn | Latest | Package management |
| Docker | >= 20.x | Containerization |
| kubectl | >= 1.28.x | Kubernetes CLI |
| AWS CLI | >= 2.x | AWS management |
| Terraform | >= 1.5.x | Infrastructure provisioning |
| Jenkins | >= 2.4.x | CI/CD automation |
| Trivy | Latest | Security scanning |

### Required Accounts & Access
- ✅ AWS Account with appropriate permissions
- ✅ OpenAI API Key
- ✅ Google Custom Search API Key (optional)
- ✅ Docker Hub account (or AWS ECR access)
- ✅ SonarQube Server (for code analysis)

### Verify Installation

```bash
# Check Node.js version
node --version  # Should show v19.x.x

# Check Docker
docker --version

# Check kubectl
kubectl version --client

# Check AWS CLI
aws --version

# Check Terraform
terraform --version

# Check Trivy
trivy --version
```

---

## 🚀 Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/YourUsername/ChatBot-UI-EKS.git
cd ChatBot-UI-EKS
```

### Step 2: Install Dependencies

```bash
npm install --prefer-offline --no-audit
# or
yarn install
```

### Step 3: Environment Configuration

Create a `.env.local` file in the root directory:

```bash
cp .env.example .env.local
```

Edit `.env.local` with your configurations:

```env
# OpenAI Configuration
OPENAI_API_KEY=your_openai_api_key_here
OPENAI_API_HOST=https://api.openai.com

# Google Search (Optional)
GOOGLE_API_KEY=your_google_api_key
GOOGLE_CSE_ID=your_custom_search_engine_id

# Application Settings
NEXT_PUBLIC_DEFAULT_SYSTEM_PROMPT="You are ChatGPT, a helpful assistant."
NEXT_PUBLIC_DEFAULT_TEMPERATURE=1
DEFAULT_MODEL=gpt-3.5-turbo

# Server Configuration
NEXT_PUBLIC_API_URL=http://localhost:3000
PORT=3000
```

### Step 4: Run Development Server

```bash
npm run dev
# or
yarn dev
```

Visit `http://localhost:3000` to see the application.

---

## 🐳 Docker Deployment

### Local Docker Build & Run

```bash
# Build the Docker image
docker build -t chatbot-ui:latest .

# Run the container
docker run -p 3000:3000 \
  -e OPENAI_API_KEY=your_api_key \
  chatbot-ui:latest
```

### Using Docker Compose

```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

### Verify Container

```bash
# Check running containers
docker ps

# View container logs
docker logs <container_id>

# Access container shell
docker exec -it <container_id> /bin/sh
```

---

## ☸️ Kubernetes Deployment on AWS EKS

### Complete Step-by-Step Guide

#### Step 1: Configure AWS Credentials

```bash
# Configure AWS CLI
aws configure

# Enter your credentials:
# AWS Access Key ID: YOUR_ACCESS_KEY
# AWS Secret Access Key: YOUR_SECRET_KEY
# Default region: us-east-1
# Default output format: json

# Verify configuration
aws sts get-caller-identity
```

#### Step 2: Prepare Terraform Variables

Navigate to the Terraform directory and update variables:

```bash
cd EKS-TF
```

Edit `variables.tfvars`:

```hcl
aws_region     = "us-east-1"
cluster_name   = "chatbot-eks-cluster"
vpc_cidr       = "10.0.0.0/16"

# Public Subnets
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

# Private Subnets
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

# Node Group Configuration
instance_types = ["t3.medium"]
desired_size   = 2
max_size       = 4
min_size       = 1
```

#### Step 3: Provision Infrastructure with Terraform

```bash
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Review the execution plan
terraform plan -var-file="variables.tfvars"

# Apply the configuration
terraform apply -var-file="variables.tfvars" -auto-approve
```

**Expected Output:**
```
Apply complete! Resources: 25 added, 0 changed, 0 destroyed.

Outputs:

cluster_endpoint = "https://XXXXX.gr7.us-east-1.eks.amazonaws.com"
cluster_name = "chatbot-eks-cluster"
cluster_security_group_id = "sg-XXXXX"
```

**What This Creates:**
- ✅ VPC with public and private subnets across 2 availability zones
- ✅ Internet Gateway and NAT Gateways
- ✅ EKS Cluster with control plane
- ✅ EKS Node Group with auto-scaling
- ✅ IAM roles and policies
- ✅ Security groups and network ACLs

#### Step 4: Configure kubectl for EKS

```bash
# Update kubeconfig
aws eks update-kubeconfig \
  --region us-east-1 \
  --name chatbot-eks-cluster

# Verify connection
kubectl get nodes

# Expected output:
# NAME                          STATUS   ROLES    AGE   VERSION
# ip-10-0-1-xxx.ec2.internal   Ready    <none>   5m    v1.28.x
# ip-10-0-2-xxx.ec2.internal   Ready    <none>   5m    v1.28.x

# Check cluster info
kubectl cluster-info
```

#### Step 5: Build and Push Docker Image

##### Option A: Docker Hub

```bash
# Build image
docker build -t chatbot-ui:v1.0.0 .

# Tag for Docker Hub
docker tag chatbot-ui:v1.0.0 aliwazeer/chatbot-ui:latest

# Login to Docker Hub
docker login

# Push image
docker push aliwazeer/chatbot-ui:latest
```

##### Option B: AWS ECR

```bash
# Create ECR repository
aws ecr create-repository --repository-name chatbot-ui --region us-east-1

# Get login password
aws ecr get-login-password --region us-east-1 | \
  docker login --username AWS --password-stdin \
  YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

# Build and tag
docker build -t chatbot-ui:v1.0.0 .
docker tag chatbot-ui:v1.0.0 \
  YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/chatbot-ui:latest

# Push to ECR
docker push YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/chatbot-ui:latest
```

#### Step 6: Create Kubernetes Secrets

```bash
# Create secret for OpenAI API key
kubectl create secret generic chatbot-secrets \
  --from-literal=openai-api-key='your_openai_api_key_here'

# Verify secret creation
kubectl get secrets

# View secret details (encoded)
kubectl describe secret chatbot-secrets
```

#### Step 9: Access the Application

```bash
# Get the LoadBalancer URL
kubectl get svc chatbot-ui-service -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'

# Wait for LoadBalancer to be ready (may take 2-3 minutes)
# Then access your application at:
# http://<EXTERNAL-IP>
```

#### Step 10: Verify Deployment

```bash
# View pod logs
kubectl logs -f deployment/chatbot-ui

# Check pod details
kubectl describe pod <pod-name>

# Test application endpoint
curl http://<EXTERNAL-IP>

# Check events
kubectl get events --sort-by='.lastTimestamp'
```

---

## 🔄 CI/CD Pipeline with Jenkins

### Complete Jenkins Setup Guide

#### Step 1: Install Jenkins

```bash
# Install Java (required for Jenkins)
sudo apt update
sudo apt install openjdk-17-jdk -y

# Add Jenkins repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | \
  sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt update
sudo apt install jenkins -y

# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Get initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Access Jenkins at: `http://your-server-ip:8080`

#### Step 2: Install Required Jenkins Plugins

Navigate to: **Manage Jenkins → Plugins → Available plugins**

Install the following plugins:
- ✅ Docker Pipeline
- ✅ Kubernetes CLI
- ✅ AWS Steps
- ✅ Git
- ✅ Pipeline
- ✅ SonarQube Scanner
- ✅ OWASP Dependency-Check
- ✅ Credentials Binding

#### Step 3: Install Required Tools on Jenkins Server

```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker jenkins

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | \
  sudo apt-key add -
echo "deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | \
  sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
unzip terraform_1.6.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install Node.js 19
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash -
sudo apt-get install -y nodejs

# Restart Jenkins
sudo systemctl restart jenkins
```

#### Step 4: Configure Global Tools in Jenkins

**Navigate to:** Manage Jenkins → Tools

##### Configure JDK
- Name: `jdk17.0.17+10`
- JAVA_HOME: `/usr/lib/jvm/java-17-openjdk-amd64`

##### Configure Node.js
- Name: `node19`
- Install automatically from nodejs.org
- Version: 19.x

##### Configure SonarQube Scanner
- Name: `sonar-scanner`
- Install automatically from Maven Central
- Version: Latest

##### Configure Docker
- Name: `docker`
- Installation: Docker from docker.com

##### Configure OWASP Dependency-Check
- Name: `DP-Check`
- Install automatically from GitHub

#### Step 5: Configure Jenkins Credentials

**Navigate to:** Manage Jenkins → Credentials → System → Global credentials

Add the following credentials:

##### 1. AWS Credentials
- Kind: **AWS Credentials**
- ID: `aws-key`
- Access Key ID: `YOUR_AWS_ACCESS_KEY`
- Secret Access Key: `YOUR_AWS_SECRET_KEY`
- Description: `AWS Credentials for EKS`

##### 2. Docker Hub Credentials
- Kind: **Username with password**
- ID: `docker`
- Username: `your-dockerhub-username`
- Password: `your-dockerhub-password`
- Description: `Docker Hub Credentials`

##### 3. Kubernetes Config File
- Kind: **Secret file**
- ID: `k8s`
- File: Upload your kubeconfig file (usually from `~/.kube/config`)
- Description: `EKS Kubeconfig`

**To get your kubeconfig:**
```bash
# Get kubeconfig content
cat ~/.kube/config

# Or download it
aws eks update-kubeconfig --region us-east

```



# Jenkins

<img width="1366" height="673" alt="Screenshot (991)" src="https://github.com/user-attachments/assets/d010cf5e-9447-4119-8451-c5aa9a6df666" />
<img width="1366" height="697" alt="Screenshot (988)" src="https://github.com/user-attachments/assets/f9827557-853c-435b-96dc-4719cf1540ed" />
<img width="1366" height="673" alt="Screenshot (983)" src="https://github.com/user-attachments/assets/edb7acc0-64b7-4ef2-9f83-d14c9aba0f13" />
<img width="1366" height="685" alt="Screenshot (967)" src="https://github.com/user-attachments/assets/95fe3a11-5e6c-4d22-957e-f47d91eefb45" />
<img width="1366" height="685" alt="Screenshot (966)" src="https://github.com/user-attachments/assets/4e68f298-ab08-4d3f-b150-3cb552cef427" />
<img width="1366" height="683" alt="Screenshot (952)" src="https://github.com/user-attachments/assets/b5799f3d-0c97-4dd4-96b0-d843aea3ee67" />
<img width="1366" height="689" alt="Screenshot (949)" src="https://github.com/user-attachments/assets/c2a6ab23-6ea6-4ea7-b57f-9b563954b1e9" />
<img width="1366" height="673" alt="Screenshot (948)" src="https://github.com/user-attachments/assets/e7a48bb2-1d4d-4ad5-acb8-5242cb469f4e" />
<img width="1366" height="673" alt="Screenshot (935)" src="https://github.com/user-attachments/assets/f2fe949c-ac2b-4a50-b2c5-93078dd3d804" />
<img width="1366" height="673" alt="Screenshot (934)" src="https://github.com/user-attachments/assets/8fefd77b-5e6a-4691-90e2-f019e87011ae" />
<img width="1366" height="708" alt="Screenshot (933)" src="https://github.com/user-attachments/assets/73c4e935-dcd5-42c9-ace9-aec4ec37d4bb" />
<img width="1366" height="670" alt="Screenshot (994)" src="https://github.com/user-attachments/assets/582076ca-c620-46ab-b669-0dca4808102f" />


# Docker

<img width="1366" height="677" alt="Screenshot (963)" src="https://github.com/user-attachments/assets/8032c88d-e5a5-4ec0-97c1-0cb930cd1246" />



# SonarQube

<img width="1366" height="683" alt="Screenshot (956)" src="https://github.com/user-attachments/assets/3187653d-6204-4594-aae4-f948374c70d1" />
<img width="1366" height="685" alt="Screenshot (955)" src="https://github.com/user-attachments/assets/9edb4926-e187-45aa-b552-a4e7c7e911c7" />
<img width="1366" height="717" alt="Screenshot (936)" src="https://github.com/user-attachments/assets/3f49acec-b1f7-4672-bca8-e88c937be40c" />
<img width="1366" height="693" alt="Screenshot (1000)" src="https://github.com/user-attachments/assets/aeee1c68-a872-496a-9eb8-d497c95d5bec" />


# EKS Cluster

<img width="1366" height="708" alt="Screenshot (996)" src="https://github.com/user-attachments/assets/37044193-8891-4e6c-bc6d-3d120fab2a4a" />
<img width="1366" height="713" alt="Screenshot (986)" src="https://github.com/user-attachments/assets/2ea958d1-5b04-46b7-8016-0a44cfa49b1f" />
<img width="1366" height="713" alt="Screenshot (972)" src="https://github.com/user-attachments/assets/19cf427b-9b31-495b-8d67-d9dd575226b1" />
<img width="1366" height="713" alt="Screenshot (970)" src="https://github.com/user-attachments/assets/1114e1bc-6fa2-43ef-b8b8-4476846d48c3" />
<img width="1366" height="665" alt="Screenshot (961)" src="https://github.com/user-attachments/assets/bb881580-99a8-47ea-bcae-88d65a89b4c3" />
<img width="1366" height="683" alt="Screenshot (960)" src="https://github.com/user-attachments/assets/58f14b98-16a3-416a-a200-140407d45f94" />
<img width="1366" height="669" alt="Screenshot (959)" src="https://github.com/user-attachments/assets/c1d3aee7-f3ad-4094-9390-e1870ffb819a" />
<img width="1366" height="672" alt="Screenshot (957)" src="https://github.com/user-attachments/assets/5d1cd53b-6237-4cad-aefc-b5451d1d1a09" />
<img width="1366" height="683" alt="Screenshot (932)" src="https://github.com/user-attachments/assets/bf96d166-a80e-4a6f-a7c1-ae83d035d3ed" />
<img width="1366" height="694" alt="Screenshot (1001)" src="https://github.com/user-attachments/assets/dbb13250-4f12-43f7-8d6f-b54b2815885b" />


#Trivy

<img width="1366" height="683" alt="Screenshot (965)" src="https://github.com/user-attachments/assets/d39747af-0c15-4322-af29-ee30cd71d700" />
<img width="1366" height="689" alt="Screenshot (992)" src="https://github.com/user-attachments/assets/0bfff8a6-b342-4a67-8af6-f7d2744e7902" />


# ChatBot-UI

<img width="1366" height="697" alt="Screenshot (999)" src="https://github.com/user-attachments/assets/03ec5f6d-f330-431c-94c6-f558a3d3d876" />
<img width="1366" height="683" alt="Screenshot (998)" src="https://github.com/user-attachments/assets/c81aee78-8956-4462-b98e-4f5dbb18ff83" />
<img width="1366" height="689" alt="Screenshot (997)" src="https://github.com/user-attachments/assets/dcf06677-b9e0-438b-85ee-f31bc1f0e40a" />
<img width="1366" height="689" alt="Screenshot (987)" src="https://github.com/user-attachments/assets/8d8ba9e9-b1cf-4a52-b896-724615c17f46" />
<img width="1366" height="689" alt="Screenshot (984)" src="https://github.com/user-attachments/assets/7c7fe7cd-9b10-4912-8dfc-e26344993659" />
<img width="1366" height="689" alt="Screenshot (982)" src="https://github.com/user-attachments/assets/2e64bb5f-2841-4f5e-b6df-bb68c2c9195e" />
<img width="1366" height="689" alt="Screenshot (980)" src="https://github.com/user-attachments/assets/b7c47dc8-3a19-4e14-9a13-b56f9aad301d" />
<img width="1366" height="685" alt="Screenshot (979)" src="https://github.com/user-attachments/assets/6f944751-4329-4971-ac0a-7df016ba9cdd" />
<img width="1366" height="673" alt="Screenshot (974)" src="https://github.com/user-attachments/assets/803735a6-0741-40bd-807d-1a4bdcb4408e" />
<img width="1366" height="664" alt="Screenshot (973)" src="https://github.com/user-attachments/assets/e7c6f388-f937-4b56-a57a-d7438d0e5470" />
<img width="1725" height="965" alt="screenshot" src="https://github.com/user-attachments/assets/d8156b08-8af8-4a3c-bae1-335362eca3b5" />
<img width="1366" height="693" alt="Screenshot (1002)" src="https://github.com/user-attachments/assets/0fceef3f-9fdb-4033-a210-dafca71e2bf0" />

