# Instal dependency
dnf install -y dnf-utils device-mapper-persistent-data lvm2 fuse-overlayfs wget

# Add docker-ce repository for centos
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE
dnf install docker-ce docker-ce-cli containerd.io

# Jalankan service docker
systemctl enable --now docker

# Enable firewalld
systemctl enable firewalld

# start firewalld
systemctl start firewalld

# Allows container to container communication, the solution to the problem
firewall-cmd --zone=public --add-masquerade --permanent

# Allow port 2375 expose to outside network
firewall-cmd --zone=public --add-port=2375/tcp --permanent

# reload the firewall
firewall-cmd --reload

# Restart service docker
systemctl restart docker.service