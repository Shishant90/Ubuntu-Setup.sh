# Security Guidelines

## Credential Management

### 1. AWS Credentials
- Never commit AWS keys to Git
- Use AWS CLI configuration: `aws configure`
- Or use environment variables from `.env` file
- Use IAM roles for EC2 instances when possible

### 2. SSH Keys
- Store SSH keys outside the repository
- Use `~/.ssh/` directory for key storage
- Set proper permissions: `chmod 600 ~/.ssh/your-key.pem`

### 3. Terraform Variables
- Copy `terraform.tfvars.example` to `terraform.tfvars`
- Update with your actual values
- Never commit `terraform.tfvars` to Git

### 4. Jenkins Credentials
- Use Jenkins credential store for SSH keys
- Configure credentials via Jenkins UI
- Use credential IDs in pipeline scripts

## Setup Instructions

1. **Configure AWS CLI**:
   ```bash
   aws configure
   ```

2. **Create Terraform variables**:
   ```bash
   cp terraform/terraform.tfvars.example terraform/terraform.tfvars
   # Edit terraform.tfvars with your values
   ```

3. **Set environment variables**:
   ```bash
   cp .env.example .env
   # Edit .env with your values
   source .env
   ```

## Best Practices

- Use least privilege principle for IAM policies
- Enable MFA for AWS accounts
- Rotate credentials regularly
- Use AWS Secrets Manager for application secrets
- Enable CloudTrail for audit logging