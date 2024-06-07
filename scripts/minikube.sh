#!/bin/bash

# Exit the script if any command fails
set -e

# Define the Minikube version and profile
VERSION=v1.33.0
PROFILE=dev

# Define the URLs and paths
MINIKUBE_URL="https://storage.googleapis.com/minikube/releases/$VERSION/minikube-linux-amd64"
MINIKUBE_BIN="/usr/local/bin/minikube"

# Download Minikube
echo "Downloading Minikube version $VERSION..."
curl -Lo minikube-linux-amd64 $MINIKUBE_URL

# Check if the download was successful
if [ ! -f minikube-linux-amd64 ]; then
  echo "Error: Download of Minikube failed."
  exit 1
fi

# Make the downloaded file executable
chmod +x minikube-linux-amd64

# Create a temporary script for the installation
TMP_SCRIPT=$(mktemp)
cat << EOF > $TMP_SCRIPT
#!/bin/bash
set -e
mv minikube-linux-amd64 $MINIKUBE_BIN
if [ ! -L "/usr/local/bin/kubectl" ]; then
    ln -s $MINIKUBE_BIN /usr/local/bin/kubectl
fi
EOF

# Make the temporary script executable
chmod +x $TMP_SCRIPT

# Execute the temporary script with su
echo "Installing Minikube..."
sudo su -c $TMP_SCRIPT

# Remove the temporary script
rm -f $TMP_SCRIPT

# Verify if the installation was successful
if ! command -v minikube &> /dev/null; then
  echo "Error: Installation failed."
  exit 1
fi

# Configure environment variables for Minikube
export MINIKUBE_HOME=~/.minikube
export MINIKUBE_IN_STYLE=0
export CHANGE_MINIKUBE_NONE_USER=1
export MINIKUBE_ENABLE_PROFILING=0
export MINIKUBE_SUPPRESS_DOCKER_PERFORMANCE=1

# Enable Minikube autocompletion
echo "Enabling Minikube autocompletion..."
source <(minikube completion bash)

# Start Minikube with the specified profile
echo "Starting Minikube with profile $PROFILE..."
minikube start -p $PROFILE

# Set the Minikube profile
echo "Setting Minikube profile $PROFILE..."
minikube profile $PROFILE

# Configure the Docker environment to use Minikube's Docker daemon
echo "Configuring Docker environment to use Minikube's Docker daemon..."
eval $(minikube -p $PROFILE docker-env)

# Wait 60 seconds to ensure Minikube is properly configured
sleep 60

# Set alias for kubectl to use Minikube kubectl
echo "Setting alias for kubectl to use Minikube kubectl..."
alias kubectl="minikube kubectl --"

echo "Minikube has been successfully installed and configured!"
