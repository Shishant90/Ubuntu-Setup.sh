# Ubuntu DevOps Automation Project

🚀 Complete end-to-end DevOps automation with infrastructure provisioning, configuration management, and CI/CD pipeline.

## 🏗️ Architecture

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Terraform  │───▶│   AWS EC2   │───▶│   Jenkins   │───▶│   Docker    │
│     IaC     │    │  Instance   │    │   CI/CD     │    │    App      │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
                           │                                      ▲
                           ▼                                      │
                   ┌─────────────┐                        ┌─────────────┐
                   │  Cloud-Init │                        │   Ansible   │
                   │   Setup     │                        │   Deploy    │
                   └─────────────┘                        └─────────────┘
```

## 🛠️ Tech Stack

| Component | Technology | Purpose |
|-----------|------------|----------|
| **Infrastructure** | Terraform | AWS EC2 provisioning with security groups |
| **Configuration** | Ansible | Server configuration and app deployment |
| **CI/CD** | Jenkins | Automated build and deployment pipeline |
| **Containerization** | Docker | Application packaging and deployment |
| **Orchestration** | Docker Compose | Container management |
| **Initialization** | Cloud-Init | Automated server setup |

## 🚀 Quick Start

### Prerequisites
- AWS CLI configured
- Terraform installed
- Ansible installed
- SSH key pair in AWS

### 1. Infrastructure Deployment
```bash
cd terraform
# Update variables.tf with your AWS key name
terraform init
terraform plan
terraform apply
```

### 2. Application Deployment
```bash
cd ansible
# Update inventory with your server IP
ansible-playbook -i inventory deploy-app.yml
```

### 3. CI/CD Setup
1. Access Jenkins at `http://YOUR_SERVER_IP:8080`
2. Create new pipeline job
3. Point to your repository's `jenkins/jenkinsfile`
4. Configure SSH credentials for deployment

## 📁 Project Structure

```
ubuntu-setup.sh/
├── 🏗️ terraform/              # Infrastructure as Code
│   ├── main.tf               # EC2 instance + security group
│   ├── variables.tf          # Configuration variables
│   └── output.tf             # Output values
├── 🔧 ansible/               # Configuration Management
│   ├── deploy-app.yml        # Deployment playbook
│   └── inventory             # Target servers
├── 🚀 jenkins/               # CI/CD Pipeline
│   └── jenkinsfile           # Pipeline definition
├── 🐳 Docker Files
│   ├── Dockerfile            # App containerization
│   ├── docker-compose.yml    # Container orchestration
│   └── index.html            # Sample web app
├── ⚙️ setup.sh/              # Server setup script
│   └── setup.sh              # Installs Docker, Jenkins, Ansible, k3s
├── ☁️ cloud-init.yaml/       # EC2 initialization
│   └── cloud-init.yaml       # Automated setup on boot
└── 📖 README.md              # This file
```

## 🔧 Configuration

### Terraform Variables
Update `terraform/variables.tf`:
```hcl
variable "key_name" {
  default = "your-aws-key-name"  # Replace with your key
}
```

### Ansible Inventory
Update `ansible/inventory`:
```ini
[servers]
ubuntu-server ansible_host=YOUR_SERVER_IP ansible_user=ubuntu
```

## 🔄 CI/CD Pipeline

The Jenkins pipeline automatically:
1. **Checkout**: Pulls latest code from repository
2. **Build**: Creates Docker image with build number tag
3. **Deploy**: Copies compose file and deploys to server

## 🛡️ Security Features

- Security group with minimal required ports (22, 80, 8080)
- SSH key-based authentication
- UFW firewall configuration
- Docker user permissions

## 📊 Monitoring & Access

- **Application**: `http://YOUR_SERVER_IP`
- **Jenkins**: `http://YOUR_SERVER_IP:8080`
- **SSH Access**: `ssh -i your-key.pem ubuntu@YOUR_SERVER_IP`

## 🔍 Troubleshooting

| Issue | Solution |
|-------|----------|
| Terraform fails | Check AWS credentials and key name |
| Ansible connection fails | Verify server IP and SSH key |
| Jenkins build fails | Check Docker installation and permissions |
| App not accessible | Verify security group and firewall rules |

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Make changes
4. Test deployment
5. Submit pull request

## 📄 License

MIT License - see LICENSE file for details

---

**Built with ❤️ for DevOps automation**