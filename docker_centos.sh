# Install Docker On CentOS by AsadTh95 


# Update packages
yum update -y

# Install Docker
# Add repo
yum config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# remove podman dan buildah
yum remove podman buildah -y
# Install packages Docker
yum install docker-ce docker-ce-cli containerd.io -y
# Enable & start docker service
systemctl start docker.service
systemctl enable docker.service
# Run docker without root
usermod -aG docker $USER
