# Linux Server Setup Script

This Bash script automates the setup of a basic Linux server environment.  
It installs and configures **Nginx**, **Git**, **Python3**, and **Docker**, and creates a new sudo user.

## Features
- System update & upgrade  
- Installs Nginx, Git, Python3, Docker  
- Enables and starts services  
- Creates a new user with sudo privileges  

## Usage
```bash
git clone https://github.com/MehribanShukrieva/linux-server-setup.git
cd linux-server-setup
chmod +x setup.sh
./setup.sh
