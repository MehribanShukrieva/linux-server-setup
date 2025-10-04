#!/bin/bash
# =========================================
# Linux Server Setup Script
# Author: Mehriban Shukrieva
# Description: Automates basic server setup
# =========================================

# Exit immediately if a command exits with a non-zero status
set -e

echo "🔹 Starting Linux server setup..."

# --- 1. Update and upgrade the system ---
echo "🔸 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# --- 2. Install essential tools ---
echo "🔸 Installing Nginx, Git, Python3, and Docker..."
sudo apt install -y nginx git python3 python3-pip apt-transport-https ca-certificates curl software-properties-common

# --- 3. Install Docker ---
echo "🔸 Setting up Docker repository..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# --- 4. Enable and start Docker & Nginx ---
echo "🔸 Enabling and starting services..."
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable docker
sudo systemctl start docker

# --- 5. Create new user ---
read -p "Enter new username to create: " NEW_USER
if id "$NEW_USER" &>/dev/null; then
    echo "User '$NEW_USER' already exists."
else
    sudo adduser --gecos "" "$NEW_USER"
    sudo usermod -aG sudo "$NEW_USER"
    echo "User '$NEW_USER' created and added to sudo group."
fi

# --- 6. Check status ---
echo "🔸 Checking service status..."
sudo systemctl status nginx --no-pager
sudo systemctl status docker --no-pager

echo "Setup complete! Your server is ready."
