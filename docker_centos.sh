# Update packages
yum update -y
# Install Docker
# Add repo
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# remove podman dan buildah
dnf remove podman buildah
# Install packages Docker
dnf install docker-ce docker-ce-cli containerd.io
# Enable & start docker service
systemctl start docker.service
systemctl enable docker.service
# Run docker without root
usermod -aG docker $USER
