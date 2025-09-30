#!/usr/bin/env bash
set -euo pipefail

# Update system
apt-get update -y
apt-get upgrade -y

# Common tools
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release software-properties-common git unzip jq

# ---------------- Docker ----------------
if ! command -v docker >/dev/null 2>&1; then
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
usermod -aG docker ubuntu
fi

# ---------------- Jenkins ----------------
if ! systemctl is-active jenkins >/dev/null 2>&1; then
apt-get install -y openjdk-11-jre-headless
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" \
    | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update -y
apt-get install -y jenkins
systemctl enable --now jenkins
fi

# ---------------- Ansible ----------------
if ! command -v ansible >/dev/null 2>&1; then
add-apt-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible
fi

# ---------------- Kubernetes (k3s) ----------------
if ! command -v k3s >/dev/null 2>&1; then
curl -sfL https://get.k3s.io | sh -
ln -s /usr/local/bin/k3s /usr/local/bin/kubectl || true
fi

# ---------------- Firewall ----------------
apt-get install -y ufw
ufw allow OpenSSH
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 8080/tcp
ufw --force enable

echo "Setup complete!"