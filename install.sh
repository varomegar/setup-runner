#!/bin/bash

set -e

INPUT="$1"
IFS=',' read -ra ITEMS <<< "$INPUT"

for item in "${ITEMS[@]}"; do
  tech=$(echo "$item" | cut -d':' -f1 | xargs)
  version=$(echo "$item" | cut -s -d':' -f2 | xargs)

  echo "🔧 Installing $tech ${version:-(latest version)}..."

  case "$tech" in
    java)
      sudo apt-get update
      if [ -z "$version" ]; then
        sudo apt-get install -y openjdk-17-jdk
      else
        sudo apt-get install -y openjdk-"$version"-jdk
      fi
      ;;
    python)
      sudo apt-get update
      if [ -z "$version" ]; then
        sudo apt-get install -y python3
      else
        sudo apt-get install -y python"$version"
      fi
      ;;
    node)
      sudo apt-get update
      if [ -z "$version" ]; then
        curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
      else
        curl -fsSL https://deb.nodesource.com/setup_"$version".x | sudo -E bash -
      fi
      sudo apt-get install -y nodejs
      ;;
    go)
      sudo apt-get update
      if [ -z "$version" ]; then
        version="1.21.5"
      fi
      wget https://golang.org/dl/go${version}.linux-amd64.tar.gz
      sudo tar -C /usr/local -xzf go${version}.linux-amd64.tar.gz
      echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
      source $HOME/.bashrc
      ;;
    azure)
      curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
      ;;
    aws)
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
      unzip -q awscliv2.zip
      sudo ./aws/install
      ;;
    oc)
      curl -LO "https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz"
      tar -xzf openshift-client-linux.tar.gz
      sudo mv oc kubectl /usr/local/bin/
      ;;
    ibm)
      curl -fsSL https://clis.cloud.ibm.com/install/linux | sh
      ;;
    psql)
      sudo apt-get update
      sudo apt-get install -y postgresql-client
      ;;
    ansible)
      sudo apt-get update
      sudo apt-get install -y ansible
      ;;
    *)
      echo "⚠️ Technology '$tech' is not supported yet."
      ;;
  esac
done
